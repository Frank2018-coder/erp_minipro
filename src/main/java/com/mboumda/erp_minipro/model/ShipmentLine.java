package com.mboumda.erp_minipro.model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "shipment_lines",
        indexes = {
                @Index(name = "idx_shipment_lines_shipment_id", columnList = "shipment_id"),
                @Index(name = "idx_shipment_lines_sol_id", columnList = "sales_order_line_id")
        })
public class ShipmentLine {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "shipment_id", foreignKey = @ForeignKey(name = "fk_shipment_lines_shipment"))
    private Shipment shipment;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_order_line_id", foreignKey = @ForeignKey(name = "fk_shipment_lines_sol"))
    private SalesOrderLine salesOrderLine;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "fk_shipment_lines_product"))
    private Product product;

    @Column(nullable = false)
    private Integer qtyShipped;
}
