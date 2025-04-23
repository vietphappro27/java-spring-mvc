package com.example.java_spring_mvc.controller.admin;

import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.service.UploadService;
import com.example.java_spring_mvc.service.UserService;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> listUser = this.userService.getAllUserByAddress("Ha Dong");
        // System.out.println(listUser);
        // syntax: model.addAttribute("message", var);
        model.addAttribute("message", "test");
        return "hello"; // hello.jsp
    }

    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUser();
        // System.out.println(users); // show int terminal
        model.addAttribute("users", users);
        return "/admin/user/show";
    }

    @RequestMapping("/admin/user/{id}")
    public String getDetailUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("avatar", user.getAvatar());
        model.addAttribute("id", user.getId());
        model.addAttribute("fullname", user.getFullname());
        model.addAttribute("email", user.getEmail());
        model.addAttribute("address", user.getAddress());
        model.addAttribute("phone", user.getPhone());
        return "/admin/user/detail";
    }

    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "/admin/user/create";
    }

    @PostMapping(value = "admin/user/create")
    public String createUserPage(Model model,
            @ModelAttribute("newUser") User vietphap,
            @RequestParam("vietphapFile") MultipartFile file) {
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(vietphap.getPassword());
        vietphap.setAvatar(avatar);
        vietphap.setPassword(hashPassword);
        String role = vietphap.getRole().getName();
        vietphap.setRole(this.userService.getRoleByName(role));
        this.userService.handleSaveUser(vietphap);
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        model.addAttribute("avatar", currentUser.getAvatar());
        return "admin/user/update";
    }

    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model,
            @ModelAttribute("newUser") User vietphap,
            @RequestParam("vietphapFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(vietphap.getId());
        if (currentUser != null) {
            String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
            currentUser.setAvatar(avatar);
            currentUser.setAddress(vietphap.getAddress());
            currentUser.setFullname(vietphap.getFullname());
            currentUser.setPhone(vietphap.getPhone());
            System.out.println(currentUser);
            this.userService.handleSaveUser(currentUser);
        }
        System.out.println(vietphap.getId());
        return "redirect:/admin/user";
    }

    @GetMapping("/admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    @PostMapping("/admin/user/delete")
    public String postDeleteUser(Model model, @ModelAttribute("newUser") User vietphap) {
        // User user = this.userRepository.findById(vietphap.getId());
        User user = this.userService.getUserById(vietphap.getId());
        System.out.println("ID nhận được từ form: " + vietphap.getId());
        if (user != null) {
            this.userService.handleDeleteUser(user);
        } else {
            System.out.println("incorrect");
        }
        return "redirect:/admin/user";
    }

}