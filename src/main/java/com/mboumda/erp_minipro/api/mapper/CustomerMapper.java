package com.mboumda.erp_minipro.api.mapper;

import com.mboumda.erp_minipro.api.dto.CustomerCreateRequest;
import com.mboumda.erp_minipro.api.dto.CustomerUpdateRequest;
import com.mboumda.erp_minipro.model.Customer;

public class CustomerMapper {

    private CustomerMapper() {
        // classe utilitaire
    }

    public static Customer toEntity(CustomerCreateRequest dto) {
        Customer c = new Customer();
        c.setCode(dto.code);
        c.setName(dto.name);
        c.setEmail(dto.email);
        c.setPhone(dto.phone);
        c.setActive(dto.active);
        return c;
    }

    public static Customer toEntity(CustomerUpdateRequest dto) {
        Customer c = new Customer();
        c.setCode(dto.code);
        c.setName(dto.name);
        c.setEmail(dto.email);
        c.setPhone(dto.phone);
        c.setActive(dto.active);
        return c;
    }
}
