package com.example.latera.models.web;

import jakarta.persistence.*;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.math.BigInteger;


@Entity
@Getter
@Setter
@Table(name = "account_info")
public class UserModel implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private BigInteger accountdbid;

    @Column(name = "userName")
    private String userName;

    @Column(name = "passWord")
    private String passWord;

    private String email;

}
