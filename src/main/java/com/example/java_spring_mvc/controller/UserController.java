package com.example.java_spring_mvc.controller;

import org.eclipse.tags.shaded.org.apache.regexp.recompile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.java_spring_mvc.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handleHello();
        // syntax: model.addAttribute("message", var);
        model.addAttribute("message", test);
        return "hello"; // hello.jsp
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        return "/admin/user/create";
    }

}