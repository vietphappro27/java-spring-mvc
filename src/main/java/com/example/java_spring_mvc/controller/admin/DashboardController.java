package com.example.java_spring_mvc.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class DashboardController {

    @GetMapping("/admin")
    public String getDashBoard() {
        return "admin/dashboard/show";
    }
    
}
