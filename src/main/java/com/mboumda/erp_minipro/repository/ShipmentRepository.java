package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Shipment;
import com.mboumda.erp_minipro.model.emums.ShipmentStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ShipmentRepository extends JpaRepository <Shipment, Long>{
    Optional<Shipment> findByShipmentNumber(String shipmentNumber);
    boolean existsByShipmentNumber(String shipmentNumber);

    List<Shipment> findBySalesOrderId(Long salesOrderId);

    List<Shipment> findByStatus(ShipmentStatus status);
}
