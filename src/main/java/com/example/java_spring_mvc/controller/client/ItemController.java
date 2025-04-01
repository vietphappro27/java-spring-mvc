package com.example.java_spring_mvc.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ItemController {
    @GetMapping("/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        return "client/product/detail";
    }

    @GetMapping("/product")
    public String getProductPage(Model model) {
        return "client/product/show";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model) {
        return "client/cart/show";
    }

    @GetMapping("/cart/checkout")
    public String getCheckoutPage(Model model) {
        return "client/cart/checkout";
    }

}
