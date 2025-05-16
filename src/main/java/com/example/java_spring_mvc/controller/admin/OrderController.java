package com.example.java_spring_mvc.controller.admin;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.java_spring_mvc.domain.Order;
import com.example.java_spring_mvc.domain.OrderDetail;
import com.example.java_spring_mvc.service.OrderService;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OrderController {

    private OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    // show
    @GetMapping("/admin/order")
    public String getOrderPage(Model model,
            @RequestParam(name = "page", defaultValue = "1") long page) {
        PageRequest pageable = PageRequest.of((int) (page - 1), 1);
        Page<Order> pageOrder = this.orderService.getAllOrders(pageable);
        List<Order> orders = pageOrder.getContent();
        model.addAttribute("orders", orders);
        model.addAttribute("totalPages", pageOrder.getTotalPages());
        model.addAttribute("currentPage", page);
        return "admin/order/show";
    }

    // detail
    @GetMapping("/admin/order/{id}")
    public String getOrderDetailPage(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        List<OrderDetail> orderDetails = this.orderService.getOrderDetailsByOrderId(id);
        model.addAttribute("order", order);
        model.addAttribute("orderDetails", orderDetails);
        return "admin/order/detail";
    }

    // delete
    @GetMapping("/admin/order/delete/{id}")
    public String getOrderDeletePage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("order", new Order());
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(Model model, @ModelAttribute("order") Order order) {
        Order removeOrder = this.orderService.getOrderById(order.getId());
        if (removeOrder != null) {
            this.orderService.handleDeleteOrder(removeOrder);
        }
        return "redirect:/admin/order";
    }

    // update (only status)
    @GetMapping("/admin/order/update/{id}")
    public String getOrderUpdatePage(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("order", order);
        return "admin/order/update";
    }

    @PostMapping("/admin/order/update")
    public String postOrderUpdate(Model model, @ModelAttribute("order") Order order) {
        Order existingOrder = this.orderService.getOrderById(order.getId());
        if (existingOrder != null) {
            // Only update status
            existingOrder.setStatus(order.getStatus());
            this.orderService.handleSaveOrder(existingOrder);
        }
        return "redirect:/admin/order";
    }

    // update
    // @GetMapping("/admin/user/update/{id}")
    // public String getUpdateUserPage(Model model, @PathVariable long id) {
    // User currentUser = this.userService.getUserById(id);
    // model.addAttribute("newUser", currentUser);
    // model.addAttribute("avatar", currentUser.getAvatar());
    // return "admin/user/update";
    // }

    // @PostMapping("/admin/user/update")
    // public String postUpdateUser(Model model,
    // @ModelAttribute("newUser") User vietphap,
    // @RequestParam("vietphapFile") MultipartFile file) {
    // User currentUser = this.userService.getUserById(vietphap.getId());
    // if (currentUser != null) {
    // String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
    // currentUser.setAvatar(avatar);
    // currentUser.setAddress(vietphap.getAddress());
    // currentUser.setFullname(vietphap.getFullname());
    // currentUser.setPhone(vietphap.getPhone());
    // System.out.println(currentUser);
    // this.userService.handleSaveUser(currentUser);
    // }
    // System.out.println(vietphap.getId());
    // return "redirect:/admin/user";
    // }
}
