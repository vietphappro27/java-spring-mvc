package com.example.java_spring_mvc.controller.client;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.service.UploadService;
import com.example.java_spring_mvc.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AccountController {
    private final UserService userService;
    private final PasswordEncoder passwordEncoder;
    private final UploadService uploadService;

    public AccountController(UserService userService, PasswordEncoder passwordEncoder, UploadService uploadService) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
        this.uploadService = uploadService;
    }

    @GetMapping("/account")
    public String getAccountPage(Model model, HttpServletRequest request) {
        String email = (String) request.getSession().getAttribute("email");
        User user = this.userService.getUserByEmail(email);
        model.addAttribute("user", user);
        return "client/account/show";
    }

    @PostMapping("/account/update")
    public String updateAccount(
            @RequestParam("fullname") String fullname,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            @RequestParam(value = "avatar", required = false) MultipartFile avatar,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        try {
            // Lấy thông tin người dùng hiện tại
            String email = (String) request.getSession().getAttribute("email");
            User user = this.userService.getUserByEmail(email);

            // Cập nhật thông tin
            user.setFullname(fullname);
            user.setPhone(phone);
            user.setAddress(address);

            // Xử lý avatar nếu có
            if (avatar != null && !avatar.isEmpty()) {
                String avatarFileName = this.uploadService.handleSaveUploadFile(avatar, "avatar");
                user.setAvatar(avatarFileName);

                // Cập nhật avatar trong session
                HttpSession session = request.getSession();
                session.setAttribute("avatar", avatarFileName);
            }

            // Lưu thông tin người dùng
            this.userService.handleSaveUser(user);

            redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thông tin thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
        }

        return "redirect:/account";
    }

    @PostMapping("/account/change-password")
    public String changePassword(
            @RequestParam("currentPassword") String currentPassword,
            @RequestParam("newPassword") String newPassword,
            @RequestParam("confirmPassword") String confirmPassword,
            HttpServletRequest request,
            RedirectAttributes redirectAttributes) {

        try {
            // Kiểm tra xác nhận mật khẩu
            if (!newPassword.equals(confirmPassword)) {
                redirectAttributes.addFlashAttribute("errorMessage", "Mật khẩu xác nhận không khớp");
                return "redirect:/account";
            }

            // Lấy thông tin người dùng hiện tại
            String email = (String) request.getSession().getAttribute("email");
            User user = this.userService.getUserByEmail(email);

            // Kiểm tra mật khẩu hiện tại
            if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
                redirectAttributes.addFlashAttribute("errorMessage", "Mật khẩu hiện tại không đúng");
                return "redirect:/account";
            }

            // Cập nhật mật khẩu mới
            user.setPassword(passwordEncoder.encode(newPassword));

            // Lưu thông tin người dùng
            this.userService.handleSaveUser(user);

            redirectAttributes.addFlashAttribute("successMessage", "Đổi mật khẩu thành công");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Có lỗi xảy ra: " + e.getMessage());
        }

        return "redirect:/account";
    }
}
