package com.example.java_spring_mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.java_spring_mvc.domain.Order;
import com.example.java_spring_mvc.domain.OrderDetail;
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

    public List<Order> getAllOrders() {
        return this.orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        return this.orderRepository.findById(id);
    }

    public List<OrderDetail> getOrderDetailsByOrderId(long id) {
        return this.orderDetailRepository.findByOrder(this.orderRepository.findById(id));
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
}
