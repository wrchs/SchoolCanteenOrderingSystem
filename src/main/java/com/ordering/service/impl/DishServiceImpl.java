package com.ordering.service.impl;

import com.ordering.dao.IDishDao;
import com.ordering.pojo.Dish;
import com.ordering.pojo.Order;
import com.ordering.service.IDishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("dishService")
public class DishServiceImpl implements IDishService{
    @Autowired
    private IDishDao dishDao;
    @Override
    public List<Dish> findAll() {
        return dishDao.findAll();
    }

    @Override
    public Dish findById(Integer dishId) {
        return dishDao.findById(dishId);
    }

    @Override
    public Dish findByName(String dishName) {
        return dishDao.findByName(dishName);
    }

    @Override
    public List<Dish> findByType(String type) {
        return dishDao.findByType(type);
    }

    @Override
    public void saveDish(Dish dish) {
        dishDao.saveDish(dish);
    }

    @Override
    public void updateDish(Dish dish) {
        dishDao.updateDish(dish);
    }

    @Override
    public void deleteDish(Integer dishId) {
        dishDao.deleteDish(dishId);
    }

    @Override
    public void updateNumber(Integer number,Integer dishId) {
        dishDao.updateNumber(number,dishId);
    }
}
