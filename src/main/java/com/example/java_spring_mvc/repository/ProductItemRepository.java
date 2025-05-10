package com.example.java_spring_mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.java_spring_mvc.domain.ProductItem;

@Repository
public interface ProductItemRepository extends JpaRepository<ProductItem, Long> {
    ProductItem save(ProductItem productItem);
}