package com.example.java_spring_mvc;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class HelloController {

    @GetMapping("/")
    public String index() {
        return "Hello, World Vietphap! update";
    }

    @GetMapping("/user")
    public String userPage() {
        return "Only user can see this page";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "Only admin can see this page";
    }

}