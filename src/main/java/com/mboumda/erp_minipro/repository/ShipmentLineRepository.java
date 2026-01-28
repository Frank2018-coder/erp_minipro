package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.ShipmentLine;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ShipmentLineRepository extends JpaRepository<ShipmentLine, Long> {
    List<ShipmentLine> findByShipmentId(Long shipmentId);

    List<ShipmentLine> findBySalesOrderLineId(Long salesOrderLineId);
}
