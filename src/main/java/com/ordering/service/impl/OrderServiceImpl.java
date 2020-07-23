package com.ordering.service.impl;

import com.ordering.dao.IOrderDao;
import com.ordering.pojo.Order;
import com.ordering.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderService")
public class OrderServiceImpl implements IOrderService {
    @Autowired
    private IOrderDao orderDao;

    @Override
    public List<Order> findAll() {
        return orderDao.findAll();
    }

    @Override
    public List<Order> findById(Long userId) {
        return orderDao.findById(userId);
    }

    @Override
    public Order findByOId(Long orderId) {
        return orderDao.findByOId(orderId);
    }

    @Override
    public void saveOrder(Order order) {
        orderDao.saveOrder(order);
    }

    @Override
    public void deleteOrder(Long orderId) {
        orderDao.deleteOrder(orderId);
    }
}
