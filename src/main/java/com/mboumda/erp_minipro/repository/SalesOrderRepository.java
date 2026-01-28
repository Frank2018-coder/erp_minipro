package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.SalesOrder;
import com.mboumda.erp_minipro.model.emums.OrderStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface SalesOrderRepository extends JpaRepository <SalesOrder, Long>{
    Optional<SalesOrder> findByOrderNumber(String orderNumber);
    boolean existsByOrderNumber(String orderNumber);

    List<SalesOrder> findByCustomerId(Long customerId);

    List<SalesOrder> findByStatus(OrderStatus status);

    List<SalesOrder> findByOrderDateBetween(LocalDateTime start, LocalDateTime end);
}
