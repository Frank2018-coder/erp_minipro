package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.SalesOrderLine;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SalesOrderLineRepository extends JpaRepository<SalesOrderLine, Long> {
    List<SalesOrderLine> findBySalesOrderId(Long salesOrderId);

    List<SalesOrderLine> findByProductId(Long productId);
}
