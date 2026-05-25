package com.diziman.backend.repository;

import com.diziman.backend.model.Member;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface MemberRepository extends JpaRepository<Member, Long> {

    // Retorna registros do dono OU registros sem dono (dados legados)
    @Query("SELECT m FROM Member m WHERE m.owner = :owner OR m.owner IS NULL")
    Page<Member> findByOwnerOrLegacy(@Param("owner") String owner, Pageable pageable);

    @Query("SELECT m FROM Member m WHERE m.id = :id AND (m.owner = :owner OR m.owner IS NULL)")
    Optional<Member> findByIdAndOwnerOrLegacy(@Param("id") Long id, @Param("owner") String owner);
}
