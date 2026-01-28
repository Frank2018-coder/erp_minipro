package com.mboumda.erp_minipro.model;

import com.mboumda.erp_minipro.model.emums.ReservationStatus;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "stock_reservations",
        indexes = {
                @Index(name = "idx_stock_res_sales_order_id", columnList = "sales_order_id"),
                @Index(name = "idx_stock_res_line_id", columnList = "sales_order_line_id"),
                @Index(name = "idx_stock_res_location_id", columnList = "location_id"),
                @Index(name = "idx_stock_res_product_id", columnList = "product_id")
        })
public class StockReservation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Ces 2 entités seront créées à l’étape Ventes (SalesOrder + SalesOrderLine)
    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_order_id", foreignKey = @ForeignKey(name = "fk_stock_res_sales_order"))
    private SalesOrder salesOrder;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_order_line_id", foreignKey = @ForeignKey(name = "fk_stock_res_sales_order_line"))
    private SalesOrderLine salesOrderLine;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "location_id", foreignKey = @ForeignKey(name = "fk_stock_reservations_location"))
    private Location location;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "fk_stock_reservations_product"))
    private Product product;

    @Column(nullable = false)
    private Integer qtyReserved;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private ReservationStatus status = ReservationStatus.ACTIVE;

    @Column(nullable = false)
    private LocalDateTime createdAt = LocalDateTime.now();
}
