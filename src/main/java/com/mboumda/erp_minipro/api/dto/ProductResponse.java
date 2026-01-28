package com.mboumda.erp_minipro.api.dto;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProductResponse {
    private Long id;
    private String sku;
    private String name;
    private String description;
    private BigDecimal unitPrice;
    private Boolean active;

    private Long categoryId;
    private String categoryName;

    private Long supplierId;
    private String supplierName;
}
