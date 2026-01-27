package com.mboumda.erp_minipro.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "suppliers",
        uniqueConstraints = @UniqueConstraint(name = "uk_suppliers_code", columnNames = "code"))
public class Supplier {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 50)
    private String code;

    @Column(nullable = false, length = 150)
    private String name;

    @Column(length = 190)
    private String email;

    @Column(length = 40)
    private String phone;

    @Column(nullable = false)
    private Boolean active = true;
}
