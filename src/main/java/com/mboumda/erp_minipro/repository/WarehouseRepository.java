package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Warehouse;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface WarehouseRepository extends JpaRepository <Warehouse, Long>{
    Optional<Warehouse> findByCode(String code);
    boolean existsByCode(String code);

    List<Warehouse> findByActiveTrueOrderByNameAsc();
}
