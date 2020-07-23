package com.ordering.service;

import com.ordering.pojo.Dish;

import java.util.List;
public interface IDishService {
    // 查询所有
    List<Dish> findAll();

    // 查询一个
    Dish findById(Integer dishId);

    // 根据名字查询一个
    Dish findByName(String dishName);

    // 根据类型查询所有
    List<Dish> findByType(String type);

    // 保存订单
    void saveDish(Dish dish);

    // 更新订单
    void updateDish(Dish dish);

    // 删除订单
    void deleteDish(Integer dishId);

    // 更新菜的数量
    void updateNumber(Integer number,Integer dishId);
}
