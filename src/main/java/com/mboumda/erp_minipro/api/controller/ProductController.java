package com.mboumda.erp_minipro.api.controller;

import com.mboumda.erp_minipro.api.dto.ProductCreateRequest;
import com.mboumda.erp_minipro.api.dto.ProductUpdateRequest;
import com.mboumda.erp_minipro.model.Product;
import com.mboumda.erp_minipro.service.ProductService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/products")
@Tag(name = "Produits", description = "Gestion des produits")
public class ProductController {

    private final ProductService productService;

    public ProductController(ProductService productService) {
        this.productService = productService;
    }

    @PostMapping
    public Product create(@RequestBody ProductCreateRequest req) {
        Product p = new Product();
        p.setSku(req.sku);
        p.setName(req.name);
        p.setDescription(req.description);
        p.setUnitPrice(req.unitPrice);
        p.setActive(req.active);

        return productService.create(p, req.categoryId, req.supplierId);
    }

    @PutMapping("/{id}")
    public Product update(@PathVariable Long id,
                          @RequestBody ProductUpdateRequest req) {
        Product p = new Product();
        p.setSku(req.sku);
        p.setName(req.name);
        p.setDescription(req.description);
        p.setUnitPrice(req.unitPrice);
        p.setActive(req.active);

        return productService.update(id, p, req.categoryId, req.supplierId);
    }

    @GetMapping("/{id}")
    public Product getById(@PathVariable Long id) {
        return productService.getById(id);
    }

    @GetMapping
    public List<Product> listAll() {
        return productService.listAll();
    }

    @GetMapping("/active")
    public List<Product> listActive() {
        return productService.listActive();
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        productService.delete(id);
    }
}
