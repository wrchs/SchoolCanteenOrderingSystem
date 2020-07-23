package com.ordering.pojo;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Order implements Serializable{
    private Long orderId;
    private Long userId;
    private String dishList;
    @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
    private Date time;
    private BigDecimal orderMoney;

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getDishList() {
        return dishList;
    }

    public void setDishList(String dishList) {
        this.dishList = dishList;
    }

    @JsonFormat(pattern="yyyy-MM-dd HH:mm",timezone = "GMT+8")
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public BigDecimal getOrderMoney() {
        return orderMoney;
    }

    public void setOrderMoney(BigDecimal orderMoney) {
        this.orderMoney = orderMoney;
    }

    @Override
    public String toString() {
        return "Order{" +
                "userId=" + userId +
                ", dishList='" + dishList + '\'' +
                ", time=" + time +
                '}';
    }
}
