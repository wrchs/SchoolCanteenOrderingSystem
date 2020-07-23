package com.ordering.service.impl;

import com.ordering.dao.IUserDao;
import com.ordering.pojo.User;
import com.ordering.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
@Service("studentService")
public class UserServiceImpl implements IUserService {
    @Autowired
    private IUserDao userDao;

    @Override
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Override
    public User findById(Long userId) {
        return userDao.findById(userId);
    }

    @Override
    public void saveUser(User user) {
        userDao.saveUser(user);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    // 更改学生金额
    public void updateUserMoney(BigDecimal userMoney, Long userId){
        userDao.updateUserMoney(userMoney,userId);
    }

    @Override
    public void deleteUser(Long id) {
        userDao.deleteUser(id);
    }
}
