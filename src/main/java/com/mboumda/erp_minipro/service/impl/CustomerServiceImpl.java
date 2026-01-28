package com.mboumda.erp_minipro.service.impl;

import com.mboumda.erp_minipro.exception.ConflictException;
import com.mboumda.erp_minipro.exception.NotFoundException;
import com.mboumda.erp_minipro.model.Customer;
import com.mboumda.erp_minipro.repository.CustomerRepository;
import com.mboumda.erp_minipro.service.CustomerService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@Transactional
public class CustomerServiceImpl implements CustomerService {

    private final CustomerRepository customerRepository;

    public CustomerServiceImpl(CustomerRepository customerRepository) {
        this.customerRepository = customerRepository;
    }

    @Override
    public Customer create(Customer customer) {
        if (customer.getCode() == null || customer.getCode().isBlank()) {
            throw new ConflictException("Le code client est obligatoire.");
        }
        if (customerRepository.existsByCode(customer.getCode())) {
            throw new ConflictException("Code client déjà utilisé : " + customer.getCode());
        }

        if (customer.getEmail() != null && !customer.getEmail().isBlank()) {
            customerRepository.findByEmail(customer.getEmail()).ifPresent(c -> {
                throw new ConflictException("Email déjà utilisé : " + customer.getEmail());
            });
        }

        if (customer.getActive() == null) customer.setActive(true);
        if (customer.getCreatedAt() == null) {
            customer.setCreatedAt(LocalDateTime.now());
        }

        return customerRepository.save(customer);
    }

    @Override
    public Customer update(Long id, Customer customer) {
        Customer existing = getById(id);

        if (customer.getCode() != null && !customer.getCode().isBlank()
                && !customer.getCode().equals(existing.getCode())) {
            if (customerRepository.existsByCode(customer.getCode())) {
                throw new ConflictException("Code client déjà utilisé : " + customer.getCode());
            }
            existing.setCode(customer.getCode());
        }

        if (customer.getName() != null) existing.setName(customer.getName());
        if (customer.getPhone() != null) existing.setPhone(customer.getPhone());
        if (customer.getActive() != null) existing.setActive(customer.getActive());

        if (customer.getEmail() != null) {
            String newEmail = customer.getEmail().isBlank() ? null : customer.getEmail();
            if (newEmail != null && (existing.getEmail() == null || !newEmail.equals(existing.getEmail()))) {
                customerRepository.findByEmail(newEmail).ifPresent(c -> {
                    throw new ConflictException("Email déjà utilisé : " + newEmail);
                });
            }
            existing.setEmail(newEmail);
        }

        return customerRepository.save(existing);
    }

    @Override
    @Transactional(readOnly = true)
    public Customer getById(Long id) {
        return customerRepository.findById(id)
                .orElseThrow(() -> new NotFoundException("Client introuvable : id=" + id));
    }

    @Override
    @Transactional(readOnly = true)
    public Customer getByCode(String code) {
        return customerRepository.findByCode(code)
                .orElseThrow(() -> new NotFoundException("Client introuvable : code=" + code));
    }

    @Override
    @Transactional(readOnly = true)
    public List<Customer> listAll() {
        return customerRepository.findAll();
    }

    @Override
    public void delete(Long id) {
       Customer customer = getById(id);
       customerRepository.delete(customer);
    }
}
