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
        // For updates
        if (product.getId() > 0) {
            // This is an update operation
            Product savedProduct = this.productRepository.save(product);
            return;
        }
        // For create
        if (productItems == null || productItems.isEmpty()) {
            throw new IllegalArgumentException("Product must have at least one ProductItem.");
        }
        // Save new product with its items
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

    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    public void updateProductItem(long itemId, long sizeId, long quantity) {
        ProductItem item = this.productItemRepository.findById(itemId);
        if (item != null) {
            Size size = this.sizeRepository.findById(sizeId);
            if (size != null) {
                item.setSize(size);
                item.setQuantity(quantity);
                this.productItemRepository.save(item);
            }
        }
    }

    public void deleteProductItem(long itemId) {
        if (this.productItemRepository.existsById(itemId)) {
            this.productItemRepository.deleteById(itemId);
        }
    }

    public void addProductItem(long productId, long sizeId, long quantity) {
        Product product = this.productRepository.findById(productId);
        Size size = this.sizeRepository.findById(sizeId);
        if (product != null && size != null) {
            ProductItem newItem = new ProductItem();
            newItem.setProduct(product);
            newItem.setSize(size);
            newItem.setQuantity(quantity);
            newItem.setSold(0L);
            this.productItemRepository.save(newItem);
        }
    }

    public void handleDeleteProduct(Product product) {
        List<ProductItem> productItems = this.productItemRepository.findByProduct(product);
        for (ProductItem item : productItems) {
            this.productItemRepository.deleteById(item.getId());
        }
        this.productRepository.delete(product);
    }
}
