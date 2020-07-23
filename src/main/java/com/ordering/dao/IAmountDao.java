package com.ordering.dao;

import com.ordering.pojo.amount;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;

@Repository("amountDao")
public interface IAmountDao {
    // 查询食堂余额
    @Select("select * from amount")
    amount findMoney();

    // 更改金额
    @Update("update amounts set amounts=#{amounts}")
    void updateMoney(@Param("amounts") BigDecimal amounts);
}
