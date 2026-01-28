package com.mboumda.erp_minipro.service.impl;

import com.mboumda.erp_minipro.exception.ConflictException;
import com.mboumda.erp_minipro.exception.NotFoundException;
import com.mboumda.erp_minipro.model.Category;
import com.mboumda.erp_minipro.model.Product;
import com.mboumda.erp_minipro.model.Supplier;
import com.mboumda.erp_minipro.repository.CategoryRepository;
import com.mboumda.erp_minipro.repository.ProductRepository;
import com.mboumda.erp_minipro.repository.SupplierRepository;
import com.mboumda.erp_minipro.service.ProductService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

    private final ProductRepository productRepository;
    private final CategoryRepository categoryRepository;
    private final SupplierRepository supplierRepository;

    public ProductServiceImpl(ProductRepository productRepository,
                              CategoryRepository categoryRepository,
                              SupplierRepository supplierRepository) {
        this.productRepository = productRepository;
        this.categoryRepository = categoryRepository;
        this.supplierRepository = supplierRepository;
    }


    @Override
    public Product create(Product product, Long categoryId, Long supplierId) {
        if (product.getSku() == null || product.getSku().isBlank()) {
            throw new ConflictException("Le SKU est obligatoire.");
        }
        if (productRepository.existsBySku(product.getSku())) {
            throw new ConflictException("SKU déjà utilisé : " + product.getSku());
        }

        Category category = categoryRepository.findById(categoryId)
                .orElseThrow(() -> new NotFoundException("Catégorie introuvable : id=" + categoryId));
        product.setCategory(category);

        if (supplierId != null) {
            Supplier supplier = supplierRepository.findById(supplierId)
                    .orElseThrow(() -> new NotFoundException("Fournisseur introuvable : id=" + supplierId));
            product.setSupplier(supplier);
        } else {
            product.setSupplier(null);
        }

        if (product.getActive() == null) product.setActive(true);

        return productRepository.save(product);
    }

    @Override
    public Product update(Long id, Product patch, Long categoryId, Long supplierId) {
        Product existing = getById(id);

        if (patch.getSku() != null && !patch.getSku().isBlank()
                && !patch.getSku().equals(existing.getSku())) {
            if (productRepository.existsBySku(patch.getSku())) {
                throw new ConflictException("SKU déjà utilisé : " + patch.getSku());
            }
            existing.setSku(patch.getSku());
        }

        if (patch.getName() != null) existing.setName(patch.getName());
        if (patch.getDescription() != null) existing.setDescription(patch.getDescription());
        if (patch.getUnitPrice() != null) existing.setUnitPrice(patch.getUnitPrice());
        if (patch.getActive() != null) existing.setActive(patch.getActive());

        if (categoryId != null) {
            Category category = categoryRepository.findById(categoryId)
                    .orElseThrow(() -> new NotFoundException("Catégorie introuvable : id=" + categoryId));
            existing.setCategory(category);
        }

        if (supplierId != null) {
            Supplier supplier = supplierRepository.findById(supplierId)
                    .orElseThrow(() -> new NotFoundException("Fournisseur introuvable : id=" + supplierId));
            existing.setSupplier(supplier);
        } else if (supplierId == null && patch.getSupplier() == null) {
            // si tu veux permettre de "retirer" le fournisseur explicitement
            // tu le feras via un endpoint dédié ou supplierId=0
        }

        return productRepository.save(existing);
    }

    @Override
    @Transactional(readOnly = true)
    public Product getById(Long id) {
        return productRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Produit introuvable : id=" + id));
    }

    @Override
    @Transactional(readOnly = true)
    public Product getBySku(String sku) {
        return productRepository.findBySku(sku)
                .orElseThrow(() -> new NotFoundException("Produit introuvable : sku=" + sku));
    }

    @Override
    @Transactional(readOnly = true)
    public List<Product> listAll() {
        return productRepository.findAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Product> listActive() {
        return productRepository.findByActiveTrueOrderByNameAsc();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Product> listByCategory(Long categoryId) {
        return productRepository.findByCategoryId(categoryId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Product> listBySupplier(Long supplierId) {
        return productRepository.findBySupplierId(supplierId);
    }

    @Override
    public void delete(Long id) {
       Product product = getById(id);
       productRepository.delete(product);
    }
}
