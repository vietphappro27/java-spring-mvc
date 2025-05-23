package com.example.java_spring_mvc.controller.client;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

import com.example.java_spring_mvc.domain.Order;
import com.example.java_spring_mvc.domain.OrderDetail;
import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.domain.dto.PasswordResetDTO;
import com.example.java_spring_mvc.domain.dto.RegisterDTO;
import com.example.java_spring_mvc.service.EmailService;
import com.example.java_spring_mvc.service.OrderService;
import com.example.java_spring_mvc.service.OtpService;
import com.example.java_spring_mvc.service.ProductService;
import com.example.java_spring_mvc.service.UserService;

@Controller
public class HomePageController {

    private final ProductService productService;
    private final UserService userService;
    private final OrderService orderService;
    private final PasswordEncoder passwordEncoder;
    private final EmailService emailService;
    private final OtpService otpService;

    public HomePageController(ProductService productService, UserService userService, OrderService orderService,
            PasswordEncoder passwordEncoder, EmailService emailService, OtpService otpService) {
        this.productService = productService;
        this.userService = userService;
        this.orderService = orderService;
        this.passwordEncoder = passwordEncoder;
        this.emailService = emailService;
        this.otpService = otpService;
    }

    @GetMapping("/")
    public String getHomePage(Model model) {
        PageRequest pageable = PageRequest.of(0, 8);
        Page<Product> pageProduct = this.productService.getAllProduct(pageable);
        List<Product> products = pageProduct.getContent();
        model.addAttribute("products", products);
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        model.addAttribute("registerDTO", new RegisterDTO());
        return "client/auth/register";
    }

    @PostMapping("/register")
    public String register(
            @Valid @ModelAttribute("registerDTO") RegisterDTO registerDTO,
            BindingResult bindingResult) {
        // validate
        if (bindingResult.hasErrors()) {
            return "client/auth/register";
        }
        User user = this.userService.registerDTOToUser(registerDTO);
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setPassword(hashPassword);
        user.setAvatar("default.jpg");
        user.setRole(this.userService.getRoleByName("USER"));
        this.userService.handleSaveUser(user);
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/forgotPassword")
    public String getForgotPasswordPage(Model model) {
        return "client/auth/forgotPassword";
    }

    @PostMapping("/forgotPassword")
    public String forgotPassword(@RequestParam("email") String email, RedirectAttributes redirectAttributes) {

        // Check if email exists
        User user = userService.getUserByEmail(email);
        if (user == null) {
            redirectAttributes.addFlashAttribute("error", "Email không tồn tại trong hệ thống");
            return "redirect:/forgotPassword";
        }
        try {
            // Generate OTP
            String otp = otpService.generateOTP(email);

            // Send OTP to email
            emailService.sendOtpEmail(email, otp);

            redirectAttributes.addFlashAttribute("message", "Mã OTP đã được gửi đến email của bạn");
            redirectAttributes.addFlashAttribute("email", email);
            return "redirect:/confirmOTP";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("error", "Có lỗi xảy ra khi gửi OTP. Vui lòng thử lại sau.");
            return "redirect:/forgotPassword";
        }
    }

    @GetMapping("/confirmOTP")
    public String getConfirmOTPPage(Model model) {
        if (!model.containsAttribute("email")) {
            model.addAttribute("email", "");
        }
        model.addAttribute("passwordResetDTO", new PasswordResetDTO());
        return "client/auth/confirmOTP";
    }

    @PostMapping("/confirmOTP")
    public String confirmOTP(@RequestParam("email") String email,
            @RequestParam("otp") String otp,
            RedirectAttributes redirectAttributes) {
        // Validate OTP
        if (!otpService.validateOTP(email, otp)) {
            redirectAttributes.addFlashAttribute("error", "Mã OTP không hợp lệ hoặc đã hết hạn");
            redirectAttributes.addFlashAttribute("email", email);
            return "redirect:/confirmOTP";
        }

        redirectAttributes.addFlashAttribute("email", email);
        redirectAttributes.addFlashAttribute("otpValidated", true);
        return "redirect:/resetPassword";
    }

    @GetMapping("/resetPassword")
    public String getResetPasswordPage(Model model) {
        if (!model.containsAttribute("otpValidated")) {
            return "redirect:/forgotPassword";
        }

        model.addAttribute("passwordResetDTO", new PasswordResetDTO());
        return "client/auth/resetPassword";
    }

    @PostMapping("/resetPassword")
    public String resetPassword(@Valid @ModelAttribute("passwordResetDTO") PasswordResetDTO passwordResetDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {
        // Validate passwords match
        if (!passwordResetDTO.getNewPassword().equals(passwordResetDTO.getConfirmPassword())) {
            bindingResult.rejectValue("confirmPassword", "error.passwordResetDTO", "Mật khẩu xác nhận không khớp");
        }

        if (bindingResult.hasErrors()) {
            redirectAttributes.addFlashAttribute("org.springframework.validation.BindingResult.passwordResetDTO",
                    bindingResult);
            redirectAttributes.addFlashAttribute("passwordResetDTO", passwordResetDTO);
            redirectAttributes.addFlashAttribute("email", passwordResetDTO.getEmail());
            redirectAttributes.addFlashAttribute("otpValidated", true);
            return "redirect:/resetPassword";
        }

        // Update password
        User user = userService.getUserByEmail(passwordResetDTO.getEmail());
        String hashPassword = passwordEncoder.encode(passwordResetDTO.getNewPassword());
        user.setPassword(hashPassword);
        userService.handleSaveUser(user);

        redirectAttributes.addFlashAttribute("successMessage", "Mật khẩu đã được cập nhật thành công");
        return "redirect:/login";
    }

    // BUG: access denied
    @GetMapping("/access-denied")
    public String getAccessDeniedPage(Model model) {
        return "client/auth/accessDenied";
    }

    //
    @GetMapping("/order_history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id);
        List<Order> orders = this.orderService.getOrdersByUser(user);
        Map<Long, List<OrderDetail>> orderDetailMap = new HashMap<>();
        for (Order order : orders) {
            List<OrderDetail> orderDetails = this.orderService.getOrderDetailsByOrderId(order.getId());
            orderDetailMap.put(order.getId(), orderDetails);
        }
        model.addAttribute("orders", orders);
        model.addAttribute("orderDetailMap", orderDetailMap);
        return "client/cart/order_history";
    }

}
