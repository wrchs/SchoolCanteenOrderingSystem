package com.ordering.dao;

import com.ordering.pojo.Order;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("orderDao")
public interface IOrderDao {
    // 查询所有订单
    @Select("select * from orderList")
    List<Order> findAll();

    // 查询一个用户的所有订单
    @Select("select * from orderList where userId=#{userId}")
    List<Order> findById(Long userId);

    // 查询一个订单
    @Select("select * from orderList where orderId=#{orderId}")
    Order findByOId(Long orderId);

    // 保存订单
    @Insert("insert into orderList(orderId,userId,dishList,time,orderMoney)values(#{orderId},#{userId},#{dishList},#{time},#{orderMoney});")
    void saveOrder(Order order);

    // 删除订单
    @Delete("delete from orderList where orderId=#{orderId};")
    void deleteOrder(Long orderId);

}
