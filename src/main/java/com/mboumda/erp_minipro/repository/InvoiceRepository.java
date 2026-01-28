package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Invoice;
import com.mboumda.erp_minipro.model.emums.InvoiceStatus;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface InvoiceRepository extends JpaRepository<Invoice, Long> {

    Optional<Invoice> findByInvoiceNumber(String invoiceNumber);
    boolean existsByInvoiceNumber(String invoiceNumber);

    List<Invoice> findBySalesOrderId(Long salesOrderId);

    List<Invoice> findByStatus(InvoiceStatus status);
}
