package com.example.java_spring_mvc.controller.admin;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.service.ProductService;
import com.example.java_spring_mvc.service.UploadService;

import jakarta.validation.Valid;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage() {
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        Product product = new Product();
        product.setProductItems(new ArrayList<>()); // Khởi tạo danh sách
        model.addAttribute("newProduct", product);
        model.addAttribute("sizes", productService.getAllSize());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model,
            @Valid @ModelAttribute("newProduct") Product product,
            BindingResult bindingResult,
            @RequestParam("vietphapFile") MultipartFile file) {

        if (bindingResult.hasErrors()) {
            model.addAttribute("sizes", productService.getAllSize());
            return "/admin/product/create";
        }
        try {
            String image = this.uploadService.handleSaveUploadFile(file, "product");
            product.setImage(image);
            this.productService.handleSaveProduct(product);

        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("sizes", productService.getAllSize());
            return "/admin/product/create";
        }
        return "redirect:/admin/product";
    }
}
