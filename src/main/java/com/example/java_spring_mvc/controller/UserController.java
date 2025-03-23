package com.example.java_spring_mvc.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.repository.UserRepository;
import com.example.java_spring_mvc.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        // List<User> listUser= this.userService.getAllUser();
        // System.out.println(listUser);
        List<User> listUser= this.userService.getAllUserByAddress("Ha Dong");
        System.out.println(listUser);
        // syntax: model.addAttribute("message", var);
        model.addAttribute("message", "test");
        return "hello"; // hello.jsp
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUser();
        System.out.println(users);                  // show int terminal
        model.addAttribute("users", users);
        return "/admin/user/table_user";
    }

    @RequestMapping("/admin/user/{id}")
    public String requestMethodName(Model model, @PathVariable long id) {
        User user=this.userService.getUserById(id);
        model.addAttribute("id", user.getId());
        model.addAttribute("fullname", user.getFullname());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("address", user.getAddress());
        System.out.println(user);
        return "/admin/user/detail";
    }
    
    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }

    @RequestMapping(value = "admin/user/create", method=RequestMethod.POST)
    public String creatUserPage(Model model, @ModelAttribute("newUser") User vietphap) {
        System.out.println("do post "+ vietphap);
        this.userService.handleSaveUser(vietphap);
        //  redirect to URL
        return "redirect:/admin/user";
    }
    

}