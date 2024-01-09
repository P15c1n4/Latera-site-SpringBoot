package com.example.latera.models.web;

import jakarta.persistence.*;
import jdk.jfr.Timestamp;
import lombok.Getter;
import lombok.Setter;



@Entity
@Getter
@Setter
@Table(name = "evntsinfo")
public class EventModel {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private short eventType;

    private String eventTitle;

    private String eventText;

    private String eventAutor;

    private String eventTime;

}
