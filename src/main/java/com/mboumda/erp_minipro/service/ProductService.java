package com.mboumda.erp_minipro.service;

import com.mboumda.erp_minipro.model.Product;

import java.util.List;

public interface ProductService {
    Product create(Product product, Long categoryId, Long supplierId);
    Product update(Long id, Product product, Long categoryId, Long supplierId);

    Product getById(Long id);
    Product getBySku(String sku);

    List<Product> listAll();
    List<Product> listActive();
    List<Product> listByCategory(Long categoryId);
    List<Product> listBySupplier(Long supplierId);

    void delete(Long id);
}
