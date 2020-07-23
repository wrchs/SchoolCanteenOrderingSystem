package com.ordering.service.impl;

import com.ordering.dao.IAmountDao;
import com.ordering.pojo.amount;
import com.ordering.service.IAmountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;


@Service("amountService")
public class AmountServiceImpl implements IAmountService {

    @Autowired
    private IAmountDao amountDao;


    @Override
    public amount findMoney() {
        return amountDao.findMoney();
    }

    @Override
    public void updateMoney(BigDecimal amounts) {
        amountDao.updateMoney(amounts);
    }
}
