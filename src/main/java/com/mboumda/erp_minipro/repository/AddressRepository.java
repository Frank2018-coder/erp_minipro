package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Address;
import com.mboumda.erp_minipro.model.emums.AddressType;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AddressRepository extends JpaRepository <Address, Long>{
    List<Address> findByCustomerId(Long customerId);
    List<Address> findByCustomerIdAndType(Long customerId, AddressType type);
}
