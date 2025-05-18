package com.example.java_spring_mvc.controller.client;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
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
import com.example.java_spring_mvc.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    // show detail product
    @GetMapping("/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        List<ProductItem> productItems = this.productService.getProductItemsByProductId(id);
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
            @RequestParam(required = false) Optional<String> sort) {

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
            @RequestParam("note") String note) {
        User user = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        user.setId(id);
        Order order = new Order();
        order.setShipName(shipName);
        order.setShipPhone(shipPhone);
        order.setShipAddress(shipAddress);
        order.setNote(note);
        this.productService.handlePlaceOrder(user, order, session);
        return "redirect:/success";
    }

    @GetMapping("/success")
    public String getSuccessPage() {
        return "client/cart/success";
    }

}
