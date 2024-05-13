package com.diziman.backend.repository;

import com.diziman.backend.model.Offering;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OfferingRepository extends JpaRepository<Offering, Long> {
}
