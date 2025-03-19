package com.example.java_spring_mvc;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@RestController
public class HelloController {
    @GetMapping("/")
    public String index() {
        return "hello";
    }

    @GetMapping("user")
    public String userPage() {
        return "this is user page";
    }

    @GetMapping("admin")
    public String adminPage() {
        return "this is admin page";
    }
}
