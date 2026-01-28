package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.StockLevel;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface StockLevelRepository extends JpaRepository<StockLevel, Long> {
    Optional<StockLevel> findByProductIdAndLocationId(Long productId, Long locationId);

    List<StockLevel> findByProductId(Long productId);
    List<StockLevel> findByLocationId(Long locationId);
}
