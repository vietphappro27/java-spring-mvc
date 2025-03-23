package com.example.java_spring_mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.repository.UserRepository;
import com.example.java_spring_mvc.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        // syntax: model.addAttribute("message", var);
        model.addAttribute("message", "test");
        return "hello"; // hello.jsp
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }

    @RequestMapping(value = "admin/user/create", method=RequestMethod.POST)
    public String requestMethodName(Model model, @ModelAttribute("newUser") User vietphap) {
        System.out.println("do post "+ vietphap);
        this.userService.handleSaveUser(vietphap);
        return "hello";
    }
    

}