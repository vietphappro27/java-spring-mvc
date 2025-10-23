package com.example.java_spring_mvc.controller.client;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.java_spring_mvc.domain.Cart;
import com.example.java_spring_mvc.domain.CartDetail;
import com.example.java_spring_mvc.domain.Order;
import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.ProductItem;
import com.example.java_spring_mvc.domain.Size;
import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.domain.dto.ProductCriterialDTO;
import com.example.java_spring_mvc.service.OrderService;
import com.example.java_spring_mvc.service.ProductService;
import com.example.java_spring_mvc.service.VNPayService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {

    private final ProductService productService;
    private final OrderService orderService;
    private final VNPayService vnPayService;

    public ItemController(ProductService productService, OrderService orderService, VNPayService vnPayService) {
        this.productService = productService;
        this.orderService = orderService;
        this.vnPayService = vnPayService;
    }

    // show detail product
    @GetMapping("/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        List<Size> sizes = this.productService.getSizesByProductId(id);
        model.addAttribute("product", product);
        // model.addAttribute("productItems", productItems);
        model.addAttribute("sizes", sizes);
        PageRequest pageable = PageRequest.of(0, 8);
        Page<Product> pageProduct = this.productService.getAllProduct(pageable);
        List<Product> products = pageProduct.getContent();
        model.addAttribute("products", products);
        return "client/product/detail";
    }

    @PostMapping("/add-productItem-to-cart/{id}")
    public String addProductItemToCart(@PathVariable long id,
            @RequestParam("sizeId") long sizeId,
            @RequestParam("quantity") long quantity,
            HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        ProductItem productItem = this.productService.getProductItemByProductAndSize(
                this.productService.getProductById(productId),
                this.productService.getSizeById(sizeId));
        this.productService.handleAddProductItemToCart(email, productItem, quantity, session);
        return "redirect:/product/" + productId;
    }

    @GetMapping("/product")
    public String getProductPage(Model model,
            @RequestParam(required = false) Optional<String> page,
            @RequestParam(required = false) Optional<List<String>> category,
            @RequestParam(required = false) Optional<List<String>> brand,
            @RequestParam(required = false) Optional<List<String>> price,
            @RequestParam(required = false) Optional<String> sort,
            @RequestParam(required = false) Optional<String> keyword) {

        int pageNum = 1;
        try {
            if (page.isPresent()) {
                pageNum = Integer.parseInt(page.get());
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        // Tạo đối tượng ProductCriterialDTO
        ProductCriterialDTO productCriterialDTO = new ProductCriterialDTO();
        productCriterialDTO.setPage(page);
        productCriterialDTO.setCategory(category);
        productCriterialDTO.setBrand(brand);
        productCriterialDTO.setPrice(price);
        productCriterialDTO.setSort(sort);
        productCriterialDTO.setKeyword(keyword);

        Pageable pageable = PageRequest.of(pageNum - 1, 9);
        Page<Product> pageProduct = this.productService.getAllProductWithSpec(pageable, productCriterialDTO);

        List<Product> products = pageProduct.getContent();

        model.addAttribute("products", products);
        model.addAttribute("totalPages", pageProduct.getTotalPages());
        model.addAttribute("currentPage", pageNum);

        // Thêm các tham số lọc vào model để giữ trạng thái các checkbox
        if (category.isPresent()) {
            model.addAttribute("selectedCategories", category.get());
        }
        if (brand.isPresent()) {
            model.addAttribute("selectedBrands", brand.get());
        }
        if (price.isPresent()) {
            model.addAttribute("selectedPrices", price.get());
        }
        // Thêm tham số sắp xếp vào model
        if (sort.isPresent()) {
            model.addAttribute("selectedSort", sort.get());
        }
        // Thêm từ khóa tìm kiếm vào model
        if (keyword.isPresent()) {
            model.addAttribute("keyword", keyword.get());
        }

        return "client/product/show";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        User user = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        user.setId(id);
        Cart cart = this.productService.getCartByUser(user);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);
        return "client/cart/show";
    }

    @PostMapping("/delete-cart-productItem/{id}")
    public String deleteCartProductItem(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);
        return "redirect:/cart";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        User currentUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        Cart cart = this.productService.getCartByUser(currentUser);
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        double totalPrice = 0;
        for (CartDetail cartDetail : cartDetails) {
            totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
        }
        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        return "client/cart/checkout";
    }

    @PostMapping("/confirm-checkout")
    public String getConfirmCheckoutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("shipName") String shipName,
            @RequestParam("shipPhone") String shipPhone,
            @RequestParam("shipAddress") String shipAddress,
            @RequestParam("note") String note,
            @RequestParam("paymentMethod") String paymentMethod) {
        User user = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        user.setId(id);
        Order order = new Order();
        order.setShipName(shipName);
        order.setShipPhone(shipPhone);
        order.setShipAddress(shipAddress);
        order.setNote(note);
        order.setPaymentMethod(paymentMethod);

        if ("COD".equals(paymentMethod)) {
            // Xử lý thanh toán COD
            this.productService.handlePlaceOrder(user, order, session);
            return "redirect:/success";
        } else if ("VNPAY".equals(paymentMethod)) {
            // Xử lý thanh toán VNPay
            return handleVNPayPayment(request, user, order, session);
        }

        return "redirect:/checkout";
    }

    private String handleVNPayPayment(HttpServletRequest request, User user, Order order, HttpSession session) {
        try {
            // Tạo order tạm thời với status PENDING
            this.productService.handlePlaceOrder(user, order, session);

            // Lấy thông tin giỏ hàng để tính tổng tiền
            Cart cart = this.productService.getCartByUser(user);
            List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
            double totalPrice = 0;
            for (CartDetail cartDetail : cartDetails) {
                totalPrice += cartDetail.getPrice() * cartDetail.getQuantity();
            }

            // Kiểm tra số tiền tối thiểu (VNPay yêu cầu tối thiểu 5,000 VND)
            if (totalPrice < 10000) {
                // Nếu số tiền quá nhỏ, thêm phí vận chuyển hoặc yêu cầu mua thêm
                totalPrice = 10000; // Đặt tối thiểu 5,000 VND
            }

            // Tạo payment URL với thông tin chi tiết
            // Sử dụng timestamp + random để tránh trùng lặp
            String orderId = System.currentTimeMillis() + "_" + (int) (Math.random() * 1000);
            String amount = String.valueOf((long) totalPrice);
            String orderInfo = "Thanh toan don hang " + orderId;
            String ipAddress = getClientIpAddress(request);

            // Debug: In ra console để kiểm tra
            System.out.println("=== VNPay Payment Debug ===");
            System.out.println("VNPay Debug - User ID: " + user.getId());
            System.out.println("VNPay Debug - Total Price: " + totalPrice);
            System.out.println("VNPay Debug - Amount String: " + amount);
            System.out.println("VNPay Debug - Order ID: " + orderId);
            System.out.println("VNPay Debug - IP Address: " + ipAddress);
            System.out.println("VNPay Debug - Order Info: " + orderInfo);

            // Kiểm tra các tham số trước khi tạo URL
            if (amount == null || amount.isEmpty()) {
                throw new RuntimeException("Số tiền không hợp lệ");
            }
            if (ipAddress == null || ipAddress.isEmpty()) {
                ipAddress = "127.0.0.1"; // IP mặc định
            }

            String paymentUrl = vnPayService.createPaymentUrl(orderId, amount, orderInfo, ipAddress);

            // Lưu orderId vào session để xử lý sau
            session.setAttribute("vnpay_order_id", orderId);
            session.setAttribute("vnpay_amount", amount);

            System.out.println("VNPay Debug - Payment URL created successfully");
            return "redirect:" + paymentUrl;
        } catch (Exception e) {
            System.err.println("VNPay Payment Error: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/error";
        }
    }

    private String getClientIpAddress(HttpServletRequest request) {
        String xForwardedForHeader = request.getHeader("X-Forwarded-For");
        if (xForwardedForHeader == null) {
            return request.getRemoteAddr();
        } else {
            return xForwardedForHeader.split(",")[0];
        }
    }

    @GetMapping("/vnpay-return")
    public String handleVNPayReturn(HttpServletRequest request, Model model) {
        try {
            System.out.println("=== VNPay Return Debug ===");

            Map<String, String> params = new HashMap<>();
            for (String paramName : request.getParameterMap().keySet()) {
                String paramValue = request.getParameter(paramName);
                params.put(paramName, paramValue);
                System.out.println("VNPay Return - " + paramName + " = " + paramValue);
            }

            // Debug: In ra tất cả tham số
            System.out.println("VNPay Return - All Parameters: " + params);

            // Xác thực chữ ký
            boolean isValid = vnPayService.verifyPayment(params);
            System.out.println("VNPay Return - Signature Valid: " + isValid);

            if (isValid) {
                String responseCode = params.get("vnp_ResponseCode");
                String transactionStatus = params.get("vnp_TransactionStatus");
                String amount = params.get("vnp_Amount");
                String orderInfo = params.get("vnp_OrderInfo");
                String txnRef = params.get("vnp_TxnRef");

                System.out.println("VNPay Return - Response Code: " + responseCode);
                System.out.println("VNPay Return - Transaction Status: " + transactionStatus);
                System.out.println("VNPay Return - Amount: " + amount);
                System.out.println("VNPay Return - Order Info: " + orderInfo);
                System.out.println("VNPay Return - Txn Ref: " + txnRef);

                if ("00".equals(responseCode) && "00".equals(transactionStatus)) {
                    // Thanh toán thành công
                    System.out.println("VNPay Return - Payment successful!");

                    HttpSession session = request.getSession(false);
                    if (session != null) {
                        String orderId = (String) session.getAttribute("vnpay_order_id");
                        System.out.println("VNPay Return - Session Order ID: " + orderId);

                        if (orderId != null) {
                            // Cập nhật trạng thái order thành PAID
                            // TODO: Implement update order status
                            session.removeAttribute("vnpay_order_id");
                            System.out.println("VNPay Return - Order ID removed from session");
                        }
                    }

                    // Thêm thông tin vào model để hiển thị
                    model.addAttribute("message", "Thanh toán thành công! Cảm ơn bạn đã mua sắm tại P-Shoes.");
                    model.addAttribute("amount", amount);
                    model.addAttribute("orderInfo", orderInfo);
                    model.addAttribute("txnRef", txnRef);

                    return "redirect:/success";
                } else {
                    // Thanh toán thất bại
                    System.out.println("VNPay Return - Payment failed! Response Code: " + responseCode
                            + ", Transaction Status: " + transactionStatus);
                    return "redirect:/error";
                }
            } else {
                // Chữ ký không hợp lệ
                System.out.println("VNPay Return - Invalid signature!");
                return "redirect:/error";
            }
        } catch (Exception e) {
            System.err.println("VNPay Return Error: " + e.getMessage());
            e.printStackTrace();
            return "redirect:/error";
        }
    }

    @GetMapping("/success")
    public String getSuccessPage(Model model) {
        return "client/cart/success";
    }

    @GetMapping("/error")
    public String getErrorPage() {
        return "client/cart/error";
    }

    @GetMapping("/vnpay-test")
    public String getVNPayTestPage() {
        return "client/cart/vnpay-test";
    }

    @GetMapping("/vnpay-signature-test")
    public String testVNPaySignature() {
        vnPayService.testSignature();
        return "redirect:/vnpay-test";
    }

    @GetMapping("/vnpay-debug")
    public String getVNPayDebugPage() {
        return "client/cart/vnpay-debug";
    }

    @GetMapping("/vnpay-config-check")
    public String checkVNPayConfig() {
        vnPayService.checkVNPayConfig();
        return "redirect:/vnpay-test";
    }
}
