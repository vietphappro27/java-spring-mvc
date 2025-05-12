package com.example.java_spring_mvc.controller.admin;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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

    // show
    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    // create
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        Product product = new Product();
        product.setProductItems(new ArrayList<>());
        model.addAttribute("newProduct", product);
        model.addAttribute("sizes", productService.getAllSize());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProduct(Model model,
            @Valid @ModelAttribute("newProduct") Product product,
            BindingResult newProductBindingResult,
            @RequestParam("vietphapFile") MultipartFile file) {

        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + ": " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            model.addAttribute("sizes", productService.getAllSize());
            return "admin/product/create";
        }
        try {
            String image = this.uploadService.handleSaveUploadFile(file, "product");
            product.setImage(image);
            this.productService.handleSaveProduct(product);
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("sizes", productService.getAllSize());
            return "admin/product/create";
        }
        return "redirect:/admin/product";
    }

    // detail
    @GetMapping("/admin/product/{id}")
    public String getDetailProductPage(@PathVariable("id") long id, Model model) {
        Product product = this.productService.getProductById(id);
        if (product == null) {
            return "redirect:/admin/product";
        }
        model.addAttribute("product", product);
        model.addAttribute("sizes", productService.getAllSize());
        return "admin/product/detail";
    }

    // Product Item Operations
    @PostMapping("/admin/product/item/update")
    public String updateProductItem(
            @RequestParam("itemId") long itemId,
            @RequestParam("productId") long productId,
            @RequestParam("sizeId") long sizeId,
            @RequestParam("quantity") long quantity) {

        productService.updateProductItem(itemId, sizeId, quantity);
        return "redirect:/admin/product/" + productId;
    }

    @GetMapping("/admin/product/item/delete/{itemId}")
    public String deleteProductItem(
            @PathVariable("itemId") long itemId,
            @RequestParam("productId") long productId) {

        productService.deleteProductItem(itemId);
        return "redirect:/admin/product/" + productId;
    }

    @PostMapping("/admin/product/item/add")
    public String addProductItem(
            @RequestParam("productId") long productId,
            @RequestParam("sizeId") long sizeId,
            @RequestParam("quantity") long quantity) {

        productService.addProductItem(productId, sizeId, quantity);
        return "redirect:/admin/product/" + productId;
    }

    // update
    @GetMapping("/admin/product/update/{id}")
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Product currentProduct = this.productService.getProductById(id);
        model.addAttribute("newProduct", currentProduct);
        model.addAttribute("sizes", productService.getAllSize());
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update")
    public String postUpdateProduct(Model model,
            @ModelAttribute("newProduct") Product product,
            @RequestParam("vietphapFile") MultipartFile file) {
        Product currentProduct = this.productService.getProductById(product.getId());
        if (currentProduct != null) {
            // Only update image if a new file is uploaded
            if (!file.isEmpty()) {
                String image = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(image);
            }
            currentProduct.setName(product.getName());
            currentProduct.setPrice(product.getPrice());
            currentProduct.setCategory(product.getCategory());
            currentProduct.setBrand(product.getBrand());
            currentProduct.setDescription(product.getDescription());
            this.productService.handleSaveProduct(currentProduct);
        }
        return "redirect:/admin/product";
    }

    // delete
    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("product", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("product") Product product) {
        Product currentProduct = this.productService.getProductById(product.getId());
        this.productService.handleDeleteProduct(currentProduct);
        return "redirect:/admin/product";
    }
    // @GetMapping("/admin/user/delete/{id}")
    // public String getDeleteUserPage(Model model, @PathVariable long id) {
    // model.addAttribute("id", id);
    // model.addAttribute("newUser", new User());
    // return "admin/user/delete";
    // }

    // @PostMapping("/admin/user/delete")
    // public String postDeleteUser(Model model, @ModelAttribute("newUser") User
    // vietphap) {
    // User user = this.userService.getUserById(vietphap.getId());
    // if (user != null) {
    // this.userService.handleDeleteUser(user);
    // } else {
    // System.out.println("incorrect");
    // }
    // return "redirect:/admin/user";
    // }
}
