package com.ordering.pojo;

import java.io.Serializable;

public class Car implements Serializable {
    private String dishName;
    private Double money;
    private String studentName;
    private Integer number;
    private Double total;

    public String getDishName() {
        return dishName;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public Double getMoney() {
        return money;
    }

    public void setMoney(Double money) {
        this.money = money;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Car{" +
                "dishName='" + dishName + '\'' +
                ", money=" + money +
                ", studentName='" + studentName + '\'' +
                ", number=" + number +
                ", total=" + total +
                '}';
    }
}
