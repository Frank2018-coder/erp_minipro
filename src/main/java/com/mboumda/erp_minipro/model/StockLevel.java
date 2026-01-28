package com.mboumda.erp_minipro.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "stock_levels",
        uniqueConstraints = @UniqueConstraint(name = "uk_stock_levels_product_location", columnNames = {"product_id", "location_id"}))
public class StockLevel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "fk_stock_levels_product"))
    private Product product;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "location_id", foreignKey = @ForeignKey(name = "fk_stock_levels_location"))
    private Location location;

    @Column(nullable = false)
    private Integer qtyOnHand = 0;

    @Column(nullable = false)
    private Integer qtyReserved = 0;

    @Transient
    public int getQtyAvailable() {
        return Math.max(0, (qtyOnHand == null ? 0 : qtyOnHand) - (qtyReserved == null ? 0 : qtyReserved));
    }
}
