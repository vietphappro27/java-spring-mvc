package com.example.java_spring_mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.java_spring_mvc.domain.Cart;
import com.example.java_spring_mvc.domain.CartDetail;
import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.ProductItem;

@Repository
public interface CartDetailRepository extends JpaRepository<CartDetail, Long> {
    // boolean existsByCartAndProduct(Cart cart, Product product);

    boolean existsByCartAndProductItem(Cart cart, ProductItem productItem);

    // CartDetail findByCartAndProduct(Cart cart, Product product);

    CartDetail findByCartAndProductItem(Cart cart, ProductItem productItem);
}