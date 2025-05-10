package com.example.java_spring_mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.ProductItem;
import com.example.java_spring_mvc.domain.Size;
import com.example.java_spring_mvc.repository.ProductItemRepository;
import com.example.java_spring_mvc.repository.ProductRepository;
import com.example.java_spring_mvc.repository.SizeRepository;

@Service
public class ProductService {
    private ProductRepository productRepository;
    private SizeRepository sizeRepository;
    private ProductItemRepository productItemRepository;

    public ProductService(ProductRepository productRepository, SizeRepository sizeRepository,
            ProductItemRepository productItemRepository) {
        this.productRepository = productRepository;
        this.sizeRepository = sizeRepository;
        this.productItemRepository = productItemRepository;
    }

    public void handleSaveProduct(Product product) {
        List<ProductItem> productItems = product.getProductItems();
        if (productItems == null || productItems.isEmpty()) {
            throw new IllegalArgumentException("Product must have at least one ProductItem.");
        }
        Product savedProduct = this.productRepository.save(product);
        for (ProductItem item : productItems) {
            item.setProduct(savedProduct);
            item.setSold(0L);
            this.productItemRepository.save(item);
        }
    }

    public List<Size> getAllSize() {
        return this.sizeRepository.findAll();
    }
}
