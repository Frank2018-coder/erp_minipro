package com.mboumda.erp_minipro.model;

import com.mboumda.erp_minipro.model.emums.StockMoveType;
import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "stock_moves",
        indexes = {
                @Index(name = "idx_stock_moves_product_id", columnList = "product_id"),
                @Index(name = "idx_stock_moves_created_at", columnList = "created_at")
        })
public class StockMove {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false, length = 20)
    private StockMoveType type;

    @ManyToOne(optional = false, fetch = FetchType.LAZY)
    @JoinColumn(name = "product_id", foreignKey = @ForeignKey(name = "fk_stock_moves_product"))
    private Product product;

    @Column(nullable = false)
    private Integer qty;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "from_location_id", foreignKey = @ForeignKey(name = "fk_stock_moves_from_location"))
    private Location fromLocation;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "to_location_id", foreignKey = @ForeignKey(name = "fk_stock_moves_to_location"))
    private Location toLocation;

    @Column(length = 50)
    private String referenceType;

    private Long referenceId;

    @Column(nullable = false)
    private LocalDateTime createdAt = LocalDateTime.now();
}
