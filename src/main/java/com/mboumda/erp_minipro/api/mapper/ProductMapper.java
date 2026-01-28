package com.mboumda.erp_minipro.api.mapper;

import com.mboumda.erp_minipro.api.dto.ProductCreateRequest;
import com.mboumda.erp_minipro.api.dto.ProductUpdateRequest;
import com.mboumda.erp_minipro.model.Product;

public class ProductMapper {


    private ProductMapper() {
        // classe utilitaire
    }

    public static Product toEntity(ProductCreateRequest dto) {
        Product p = new Product();
        p.setSku(dto.sku);
        p.setName(dto.name);
        p.setDescription(dto.getDescription());
        p.setUnitPrice(dto.unitPrice);
        p.setActive(dto.active);
        return p;
    }

    public static Product toEntity(ProductUpdateRequest dto) {
        Product p = new Product();
        p.setSku(dto.sku);
        p.setName(dto.name);
        p.setDescription(dto.description);
        p.setUnitPrice(dto.unitPrice);
        p.setActive(dto.active);
        return p;
    }
}
