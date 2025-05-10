package com.example.java_spring_mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.java_spring_mvc.domain.Size;

@Repository
public interface SizeRepository extends JpaRepository<Size, Long> {
    Size findBySizeValue(String size_value);
    // findALl() : in-built
}