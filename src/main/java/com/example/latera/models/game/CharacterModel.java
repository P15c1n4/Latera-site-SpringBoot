package com.example.latera.models.game;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import org.springframework.context.annotation.Configuration;

import java.io.Serializable;


@Entity
@Getter
@Setter
@Configuration
@Table(name = "Users")
public class CharacterModel implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    private Integer userDBID;

    @Column(name = "class")
    private Integer userClass;

    @Column(name = "userName")
    private String userName;
}