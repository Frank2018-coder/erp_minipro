package com.mboumda.erp_minipro.repository;

import com.mboumda.erp_minipro.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    Optional<Category> findByCode(String code);
    boolean existsByCode(String code);

    List<Category> findByActiveTrueOrderByNameAsc();
}
