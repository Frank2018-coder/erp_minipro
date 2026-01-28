package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Customer;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface CustomerRepository extends JpaRepository <Customer, Long>{
    Optional<Customer> findByCode(String code);
    boolean existsByCode(String code);

    Optional<Customer> findByEmail(String email);
}
