package com.ordering.service;

import com.ordering.pojo.amount;

import java.math.BigDecimal;

public interface IAmountService {
    // 查询食堂余额
    amount findMoney();

    // 更改金额
    void updateMoney(BigDecimal amounts);
}
