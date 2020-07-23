package com.ordering.dao;

import com.ordering.pojo.Dish;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("dishDao")
public interface IDishDao {
    // 查询所有
    @Select("select * from Dish;")
    List<Dish> findAll();

    // 根据Id查询一个
    @Select("select * from Dish where dishId = #{dishId};")
    Dish findById(Integer dishId);

    // 根据名字查询一个
    @Select("select * from Dish where dishName = #{dishName};")
    Dish findByName(String dishName);

    // 根据类型查询所有
    @Select("select * from Dish where type = #{type}")
    List<Dish> findByType(String type);

    // 保存订单
    @Insert("insert into Dish(dishName,type,money,number,img)values(#{dishName},#{type},#{money},#{number},#{img});")
    void saveDish(Dish dish);

    // 更新订单
    @Update("update Dish set dishName=#{dishName},type=#{type},money=#{money},number=#{number},img=#{img} where dishId=#{dishId}")
    void updateDish(Dish dish);

    // 删除订单
    @Delete("delete from Dish where dishId = #{dishId};")
    void deleteDish(Integer dishId);

    // 更新菜的数量
    @Update("update dish set number=#{number} where dishId=#{dishId}")
    void updateNumber(@Param("number") Integer number, @Param("dishId") Integer dishId);
}
