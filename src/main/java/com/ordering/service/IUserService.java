package com.ordering.service;

import com.ordering.pojo.User;

import java.math.BigDecimal;
import java.util.List;

public interface IUserService {
    // 查询所有用户
    List<User> findAll();

    // 查询一个用户
    User findById(Long userId);

    // 保存用户
    void saveUser(User user);

    // 更改用户
    void updateUser(User user);

    // 更改用户金额
    void updateUserMoney(BigDecimal userMoney, Long userId);

    // 删除用户
    void deleteUser(Long id);

}
