package com.ordering.dao;

import com.ordering.pojo.DishType;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository("dishTypeDao")
public interface IDishTypeDao {
    // 查询所有类型
    @Select("select * from dishType;")
    List<DishType> findAll();
}
