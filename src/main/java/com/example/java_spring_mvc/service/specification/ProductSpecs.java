package com.example.java_spring_mvc.service.specification;

import java.util.List;

import org.springframework.data.jpa.domain.Specification;

import com.example.java_spring_mvc.domain.Product;
import com.example.java_spring_mvc.domain.Product_;

public class ProductSpecs {

    public static Specification<Product> nameLike(String name) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.like(root.get(Product_.NAME), "%" + name + "%");
    }

    // case1: min price
    public static Specification<Product> minPrice(double minPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.greaterThanOrEqualTo(root.get(Product_.PRICE),
                minPrice);
    }

    // case2: max price
    public static Specification<Product> maxPrice(double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.lessThanOrEqualTo(root.get(Product_.PRICE),
                maxPrice);
    }

    // case3: category
    public static Specification<Product> matchCategory(String category) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.equal(root.get(Product_.CATEGORY), category);
    }

    // case4: list category
    public static Specification<Product> matchListCategory(List<String> categories) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.CATEGORY)).value(categories);
    }

    // case4: list category
    public static Specification<Product> matchListBrand(List<String> brands) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.in(root.get(Product_.BRAND)).value(brands);
    }

    // case5: price
    public static Specification<Product> matchPrice(double minPrice, double maxPrice) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), minPrice, maxPrice);
    }

    // case6: list price
    public static Specification<Product> matchMultiplePrice(double min, double max) {
        return (root, query, criteriaBuilder) -> criteriaBuilder.between(root.get(Product_.PRICE), min, max);
    }
}
