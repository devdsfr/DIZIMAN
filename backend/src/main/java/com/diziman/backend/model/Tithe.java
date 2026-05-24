package com.diziman.backend.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Getter
@Setter
public class Tithe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Double value;

    @Temporal(TemporalType.TIMESTAMP)
    @CreationTimestamp
    private Date date;

    @Temporal(TemporalType.DATE)
    private Date titheDate;

    @ManyToOne(fetch = FetchType.EAGER)
  