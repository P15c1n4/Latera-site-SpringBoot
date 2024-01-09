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
@Table(name = "DungeonClearCount")
public class DgCountModel implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    private Integer userDbId;

    private Integer continentId;

    private Integer clearCount;

    private String userName;

    @Column(name = "class")
    private Integer userClass;

    private String dgStatus;


}
