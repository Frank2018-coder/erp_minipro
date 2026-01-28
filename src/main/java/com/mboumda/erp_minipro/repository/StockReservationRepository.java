package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.StockReservation;
import com.mboumda.erp_minipro.model.emums.ReservationStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface StockReservationRepository extends JpaRepository <StockReservation, Long>{
    List<StockReservation> findBySalesOrderId(Long salesOrderId);

    List<StockReservation> findBySalesOrderLineId(Long salesOrderLineId);

    List<StockReservation> findByStatus(ReservationStatus status);

    List<StockReservation> findBySalesOrderIdAndStatus(Long salesOrderId, ReservationStatus status);
}
