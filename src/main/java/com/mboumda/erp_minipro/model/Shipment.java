package com.mboumda.erp_minipro.model;

import com.mboumda.erp_minipro.model.emums.ShipmentStatus;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@Entity
@Table(name = "shipments",
        uniqueConstraints = @UniqueConstraint(name = "uk_shipments_shipment_number", columnNames = "shipment_number"),
        indexes = {
                @Index(name = "idx_shipments_order_id", columnList = "sales_order_id"),
                @Index(name = "idx_shipments_status", columnList = "status")
        })
public class Shipment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "shipment_number", nullable = false, length = 50)
    private String shipmentNumber;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "sales_order_id", foreignKey = @ForeignKey(name = "fk_shipments_order"))
    private SalesOrder salesOrder;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private ShipmentStatus status = ShipmentStatus.DRAFT;

    private LocalDateTime shippedAt;
    private LocalDateTime deliveredAt;

    @Column(length = 500)
    private String notes;

    @OneToMany(mappedBy = "shipment", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ShipmentLine> lines = new ArrayList<>();

    public void addLine(ShipmentLine line) {
        lines.add(line);
        line.setShipment(this);
    }

    public void removeLine(ShipmentLine line) {
        lines.remove(line);
        line.setShipment(null);
    }
}
