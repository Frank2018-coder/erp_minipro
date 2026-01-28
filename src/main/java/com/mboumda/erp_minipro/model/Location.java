package com.mboumda.erp_minipro.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "locations",
        uniqueConstraints = @UniqueConstraint(name = "uk_locations_warehouse_code", columnNames = {"warehouse_id", "code"}))
public class Location {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "warehouse_id", foreignKey = @ForeignKey(name = "fk_locations_warehouse"))
    private Warehouse warehouse;

    @Column(nullable = false, length = 50)
    private String code;

    @Column(length = 150)
    private String name;

    @Column(nullable = false)
    private Boolean active = true;
}
