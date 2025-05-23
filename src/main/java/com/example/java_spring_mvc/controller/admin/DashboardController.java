package com.example.java_spring_mvc.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.java_spring_mvc.service.OrderService;
import com.example.java_spring_mvc.service.ProductService;
import com.example.java_spring_mvc.service.UserService;

@Controller
@RequestMapping("/admin")
public class DashboardController {

    @Autowired
    private UserService userService;

    @Autowired
    private ProductService productService;

    @Autowired
    private OrderService orderService;

    @GetMapping("")
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