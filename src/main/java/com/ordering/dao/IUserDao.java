package com.ordering.dao;

import com.ordering.pojo.User;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;
@Repository("userDao")
public interface IUserDao {
    // 查询所有用户
    @Select("select * from User")
    List<User> findAll();

    // 查询一个用户
    @Select("select * from User where userId=#{userId};")
    User findById(Long userId);

    // 保存用户
    @Insert("insert into User(userId,userName,userPassword,money)values(#{userId},#{userName},#{userPassword},#{money});")
    void saveUser(User user);

    // 更改用户
    @Update("update user set userName=#{userName},userPassword=#{userPassword},money=#{money} where userId=#{userId}")
    void updateUser(User user);

    // 更改用户金额
    @Update("update user set money=#{money} where userId = #{userId};")
    void updateUserMoney(@Param("money") BigDecimal userMoney, @Param("userId") Long userId);

    // 删除用户
    @Delete("delete from user where userId=#{userId};")
    void deleteUser(Long userId);

}
