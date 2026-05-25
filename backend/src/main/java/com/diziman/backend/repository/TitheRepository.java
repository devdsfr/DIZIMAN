package com.diziman.backend.repository;

import com.diziman.backend.model.Tithe;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TitheRepository extends JpaRepository<Tithe, Long> {

    @Query("SELECT t FROM Tithe t WHERE t.owner = :owner OR t.owner IS NULL")
    Page<Tithe> findByOwnerOrLegacy(@Param("owner") String owner, Pageable pageable);

    @Query("SELECT t FROM Tithe t WHERE t.id = :id AND (t.owner = :owner OR t.owner IS NULL)")
    Optional<Tithe> findByIdAndOwnerOrLegacy(@Param("id") Long id, @Param("owner") String owner);
}
