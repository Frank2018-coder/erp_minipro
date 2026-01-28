package com.mboumda.erp_minipro.api.controller;

import com.mboumda.erp_minipro.api.dto.CustomerCreateRequest;
import com.mboumda.erp_minipro.api.dto.CustomerUpdateRequest;
import com.mboumda.erp_minipro.model.Customer;
import com.mboumda.erp_minipro.service.CustomerService;
import io.swagger.v3.oas.annotations.tags.Tag;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customers")
@Tag(name = "Clients", description = "Gestion des clients")
public class CustomerController {


    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @PostMapping
    public Customer create(@RequestBody CustomerCreateRequest req) {
        Customer c = new Customer();
        c.setCode(req.code);
        c.setName(req.name);
        c.setEmail(req.email);
        c.setPhone(req.phone);
        c.setActive(req.active);

        return customerService.create(c);
    }

    @PutMapping("/{id}")
    public Customer update(@PathVariable Long id,
                           @RequestBody CustomerUpdateRequest req) {
        Customer c = new Customer();
        c.setCode(req.code);
        c.setName(req.name);
        c.setEmail(req.email);
        c.setPhone(req.phone);
        c.setActive(req.active);

        return customerService.update(id, c);
    }

    @GetMapping("/{id}")
    public Customer getById(@PathVariable Long id) {
        return customerService.getById(id);
    }

    @GetMapping
    public List<Customer> listAll() {
        return customerService.listAll();
    }

    @DeleteMapping("/{id}")
    public void delete(@PathVariable Long id) {
        customerService.delete(id);
    }
}
