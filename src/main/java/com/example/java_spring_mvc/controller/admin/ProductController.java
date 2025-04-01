package com.example.java_spring_mvc.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.java_spring_mvc.domain.User;

@Controller
public class ProductController {
    @GetMapping("/admin/product")
    public String getProductPage() {
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        return "admin/product/create";
    }

}
