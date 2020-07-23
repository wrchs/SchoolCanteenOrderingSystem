package com.ordering.service;

import com.ordering.pojo.Order;

import java.util.List;

public interface IOrderService {

    // 查询所有订单
    List<Order> findAll();

    // 查询一个订单
    List<Order> findById(Long userId);

    // 根据订单号查询一个订单
    Order findByOId(Long orderId);

    // 保存订单
    void saveOrder(Order order);

    // 删除订单
    void deleteOrder(Long orderId);

}
