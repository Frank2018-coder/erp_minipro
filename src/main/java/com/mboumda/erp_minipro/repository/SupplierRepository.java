package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Supplier;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface SupplierRepository extends JpaRepository<Supplier, Long> {
    Optional<Supplier> findByCode(String code);
    boolean existsByCode(String code);

    List<Supplier> findByActiveTrueOrderByNameAsc();
}
