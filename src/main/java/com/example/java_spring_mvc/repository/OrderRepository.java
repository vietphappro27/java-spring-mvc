package com.example.java_spring_mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.java_spring_mvc.domain.Order;
import com.example.java_spring_mvc.domain.User;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {
    List<Order> findAll();

    Order findById(long id);

    void deleteById(long id);

    List<Order> findByUser(User user);
}
