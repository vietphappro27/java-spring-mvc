package com.example.java_spring_mvc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomePageController {
    @GetMapping("/")
    public String getHomePage() {
        return "client/homepage/show";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        return "client/auth/register";
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "client/auth/login";
    }

    @GetMapping("/forgotPassword")
    public String getForgotPasswordPage(Model model) {
        return "client/auth/forgotPassword";
    }

    @GetMapping("/confirmOTP")
    public String getConfirmOTPPage(Model model) {
        return "client/auth/confirmOTP";
    }

}
