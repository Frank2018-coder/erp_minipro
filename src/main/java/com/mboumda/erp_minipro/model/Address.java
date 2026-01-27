package com.mboumda.erp_minipro.model;

import com.mboumda.erp_minipro.model.emums.AddressType;
import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "addresses")
public class Address {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id", foreignKey = @ForeignKey(name = "fk_addresses_customer"))
    private Customer customer;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private AddressType type;

    @Column(nullable = false, length = 190)
    private String line1;

    @Column(length = 190)
    private String line2;

    @Column(nullable = false, length = 120)
    private String city;

    @Column(length = 30)
    private String postalCode;

    @Column(nullable = false, length = 120)
    private String country;

    @Column(nullable = false)
    private Boolean isDefault = false;
}
