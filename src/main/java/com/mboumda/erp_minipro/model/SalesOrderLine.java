package com.mboumda.erp_minipro.model;

import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;

@Data
@Entity
@Table(name = "sales_order_lines",
        indexes = {
                @Index(name = "idx_sol_order_id", columnList = "sales_order_id"),
                @Index(name = "idx_sol_product_id", columnList = "product_id")
        })
public class SalesOrderLine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_order_id", foreignKey = @ForeignKey(name = "fk_sales_order_lines_order"))
    private SalesOrder salesOrder;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "fk_sales_order_lines_product"))
    private Product product;

    @Column(nullable = false)
    private Integer qty;

    @Column(name = "unit_price", nullable = false, precision = 12, scale = 2)
    private BigDecimal unitPrice;

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal discount = BigDecimal.ZERO;

    @Column(name = "tax_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal taxRate = new BigDecimal("15.00");

    @Column(name = "line_total", nullable = false, precision = 12, scale = 2)
    private BigDecimal lineTotal = BigDecimal.ZERO;

    // (optionnel) : réservation associée (si tu veux naviguer depuis la ligne)
    @OneToMany(mappedBy = "salesOrderLine", fetch = FetchType.LAZY)
    private java.util.List<StockReservation> reservations = new java.util.ArrayList<>();
}
