package com.mboumda.erp_minipro.model;

import com.mboumda.erp_minipro.model.emums.OrderStatus;
import jakarta.persistence.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "sales_orders",
        uniqueConstraints = @UniqueConstraint(name = "uk_sales_orders_order_number", columnNames = "order_number"),
        indexes = {
                @Index(name = "idx_sales_orders_customer_id", columnList = "customer_id"),
                @Index(name = "idx_sales_orders_status", columnList = "status"),
                @Index(name = "idx_sales_orders_order_date", columnList = "order_date")
        })
public class SalesOrder {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "order_number", nullable = false, length = 50)
    private String orderNumber;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "customer_id", foreignKey = @ForeignKey(name = "fk_sales_orders_customer"))
    private Customer customer;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 30)
    private OrderStatus status = OrderStatus.DRAFT;

    @Column(name = "order_date", nullable = false)
    private LocalDateTime orderDate = LocalDateTime.now();

    @Column(nullable = false, length = 10)
    private String currency = "CAD";

    @Column(nullable = false, precision = 12, scale = 2)
    private BigDecimal subtotal = BigDecimal.ZERO;

    @Column(name = "tax_total", nullable = false, precision = 12, scale = 2)
    private BigDecimal taxTotal = BigDecimal.ZERO;

    @Column(name = "discount_total", nullable = false, precision = 12, scale = 2)
    private BigDecimal discountTotal = BigDecimal.ZERO;

    @Column(name = "grand_total", nullable = false, precision = 12, scale = 2)
    private BigDecimal grandTotal = BigDecimal.ZERO;

    @Column(length = 500)
    private String notes;

    @OneToMany(mappedBy = "salesOrder", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SalesOrderLine> lines = new ArrayList<>();

    // (optionnel) : expéditions / factures (on les crée juste après)
    @OneToMany(mappedBy = "salesOrder", fetch = FetchType.LAZY)
    private List<Shipment> shipments = new ArrayList<>();

    @OneToMany(mappedBy = "salesOrder", fetch = FetchType.LAZY)
    private List<Invoice> invoices = new ArrayList<>();


    // helpers (pratique)
    public void addLine(SalesOrderLine line) {
        lines.add(line);
        line.setSalesOrder(this);
    }

    public void removeLine(SalesOrderLine line) {
        lines.remove(line);
        line.setSalesOrder(null);
    }


}
