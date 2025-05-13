package com.example.java_spring_mvc.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.ProductItem;
import com.example.java_spring_mvc.domain.Size;
import com.example.java_spring_mvc.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    // show detail product
    @GetMapping("/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product product = this.productService.getProductById(id);
        List<ProductItem> productItems = this.productService.getProductItemsByProductId(id);
        List<Size> sizes = this.productService.getSizesByProductId(id);
        model.addAttribute("product", product);
        model.addAttribute("productItems", productItems);
        model.addAttribute("sizes", sizes);
        model.addAttribute("products", this.productService.getAllProduct());
        return "client/product/detail";
    }

    @PostMapping("/add-product-to-cart/{id}")
    public String addProductToCart(@PathVariable long id, HttpServletRequest request) {

        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");

        this.productService.handleAddProductToCart(email, productId);
        return "redirect:/";
    }

    @GetMapping("/product")
    public String getProductPage(Model model) {
        return "client/product/show";
    }

    @GetMapping("/cart")
    public String getCartPage(Model model) {
        return "client/cart/show";
    }

    @GetMapping("/cart/checkout")
    public String getCheckoutPage(Model model) {
        return "client/cart/checkout";
    }

}
