package com.ordering.service;

import com.ordering.pojo.DishType;

import java.util.List;

public interface IDishTypeService {
    // 查询所有菜品类别
    List<DishType> findAll();
}
