package com.example.java_spring_mvc.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.java_spring_mvc.service.OrderService;
import com.example.java_spring_mvc.service.ProductService;
import com.example.java_spring_mvc.service.UserService;

@Controller
public class DashboardController {

    private UserService userService;
    private ProductService productService;
    private OrderService orderService;

    public DashboardController(UserService userService, ProductService productService, OrderService orderService) {
        this.userService = userService;
        this.productService = productService;
        this.orderService = orderService;
    }

    @GetMapping("/admin")
    public String getDashBoard(Model model) {
        int countUser = this.userService.countUser();
        int countProduct = this.productService.countProduct();
        int countOrder = this.orderService.countOrder();
        model.addAttribute("countUser", countUser);
        model.addAttribute("countProduct", countProduct);
        model.addAttribute("countOrder", countOrder);
        return "admin/dashboard/show";
    }

}
