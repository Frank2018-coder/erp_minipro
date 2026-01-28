package com.mboumda.erp_minipro.service;

import com.mboumda.erp_minipro.model.Customer;

import java.util.List;

public interface CustomerService {

    Customer create(Customer customer);
    Customer update(Long id, Customer customer);

    Customer getById(Long id);
    Customer getByCode(String code);

    List<Customer> listAll();

    void delete(Long id);
}
