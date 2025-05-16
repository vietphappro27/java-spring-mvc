package com.example.java_spring_mvc.service;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.example.java_spring_mvc.domain.Order;
import com.example.java_spring_mvc.domain.OrderDetail;
import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.repository.OrderDetailRepository;
import com.example.java_spring_mvc.repository.OrderRepository;

@Service
public class OrderService {
    private OrderRepository orderRepository;
    private OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public Page<Order> getAllOrders(Pageable pageable) {
        return this.orderRepository.findAll(pageable);
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public List<OrderDetail> getOrderDetailsByOrderId(long id) {
        return this.orderDetailRepository.findByOrder(this.orderRepository.findById(id));
    }

    public List<Order> getOrdersByUser(User user) {
        return this.orderRepository.findByUser(user);
    }

    public void handleSaveOrder(Order order) {
        this.orderRepository.save(order);
    }

    public void handleDeleteOrder(Order order) {
        List<OrderDetail> orderDetails = this.orderDetailRepository.findByOrder(order);
        for (OrderDetail orderDetail : orderDetails) {
            this.orderDetailRepository.delete(orderDetail);
        }
        this.orderRepository.deleteById(order.getId());
    }

    public int countOrder() {
        return this.orderRepository.findAll().size();
    }
}
