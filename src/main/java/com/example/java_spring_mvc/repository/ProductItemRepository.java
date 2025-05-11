package com.example.java_spring_mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.ProductItem;

@Repository
public interface ProductItemRepository extends JpaRepository<ProductItem, Long> {
    ProductItem save(ProductItem productItem);

    List<ProductItem> findByProduct(Product product);

    ProductItem findById(long id);

    boolean existsById(long id);

    void deleteById(long id);
}