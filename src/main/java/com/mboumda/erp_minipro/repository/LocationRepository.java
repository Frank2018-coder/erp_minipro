package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Location;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface LocationRepository extends JpaRepository<Location, Long> {
    List<Location> findByWarehouseId(Long warehouseId);

    Optional<Location> findByWarehouseIdAndCode(Long warehouseId, String code);

    List<Location> findByActiveTrueOrderByCodeAsc();
}
