package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.StockMove;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.List;

public interface StockMoveRepository extends JpaRepository <StockMove, Long>{
    List<StockMove> findByProductIdOrderByCreatedAtDesc(Long productId);

    List<StockMove> findByCreatedAtBetweenOrderByCreatedAtDesc(LocalDateTime start, LocalDateTime end);
}
