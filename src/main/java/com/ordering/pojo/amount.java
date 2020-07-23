package com.ordering.pojo;

import java.io.Serializable;
import java.math.BigDecimal;

public class amount implements Serializable{
    private BigDecimal amounts;

    public BigDecimal getAmounts() {
        return amounts;
    }

    public void setAmounts(BigDecimal amounts) {
        this.amounts = amounts;
    }
}
