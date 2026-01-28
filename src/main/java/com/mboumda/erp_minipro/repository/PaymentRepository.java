package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Payment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findByInvoiceId(Long invoiceId);

    List<Payment> findByPaidAtBetween(LocalDateTime start, LocalDateTime end);
}
