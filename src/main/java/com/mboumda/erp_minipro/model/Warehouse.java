package com.mboumda.erp_minipro.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "warehouses",
        uniqueConstraints = @UniqueConstraint(name = "uk_warehouses_code", columnNames = "code"))
public class Warehouse {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 50)
    private String code;

    @Column(nullable = false, length = 150)
    private String name;

    @Column(nullable = false)
    private Boolean active = true;
}
