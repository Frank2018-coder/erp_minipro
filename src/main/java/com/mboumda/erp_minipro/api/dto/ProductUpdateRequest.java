package com.mboumda.erp_minipro.api.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProductUpdateRequest {
    public String sku;
    public String name;
    public String description;
    public BigDecimal unitPrice;
    public Boolean active;
    public Long categoryId;
    public Long supplierId;

}
