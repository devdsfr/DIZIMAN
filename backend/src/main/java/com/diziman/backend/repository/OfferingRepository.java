package com.diziman.backend.repository;

import com.diziman.backend.model.Offering;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface OfferingRepository extends JpaRepository<Offering, Long> {

    @Query("SELECT o FROM Offering o WHERE o.owner = :owner OR o.owner IS NULL")
    Page<Offering> findByOwnerOrLegacy(@Param("owner") String owner, Pageable pageable);

    @Query("SELECT o FROM Offering o WHERE o.id = :id AND (o.owner = :owner OR o.owner IS NULL)")
    Optional<Offering> findByIdAndOwnerOrLegacy(@Param("id") Long id, @Param("owner") String owner);
}
