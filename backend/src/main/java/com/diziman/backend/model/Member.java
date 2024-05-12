package com.diziman.backend.model;

import lombok.Data;
import org.hibernate.annotations.CreationTimestamp;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Data
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Name cannot be empty.")
    @Size(min = 2, max = 100, message = "Name must be between 2 and 100 characters.")
    private String name;

    @NotBlank(message = "Gender cannot be empty.")
    private String gender;

    @Temporal(TemporalType.DATE)
    private Date birthDate;

    private String profile;

    @NotBlank(message = "Login cannot be empty.")
    private String login;

    private String city;

    private String state;

    @Size(min = 8, max = 9, message = "ZIP code must be between 8 and 9 characters.")
    private String zipCode;

    @NotBlank(message = "Address cannot be empty.")
    @Size(max = 200, message = "Address can have a maximum of 200 characters.")
    private String address;

    @CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date registrationDate;
}
