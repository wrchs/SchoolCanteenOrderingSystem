package com.ordering.service.impl;

import com.ordering.dao.IDishTypeDao;
import com.ordering.pojo.DishType;
import com.ordering.service.IDishTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("dishTypeService")
public class DishTypeServiceImpl implements IDishTypeService {
    @Autowired
    private IDishTypeDao dishTypeDao;

    @Override
    public List<DishType> findAll() {
        return dishTypeDao.findAll();
    }
}
