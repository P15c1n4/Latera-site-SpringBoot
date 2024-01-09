package com.example.latera.models.web;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "offerlist")
public class OffertModel {
    private static final long serialVersionUID = 1L;


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private Integer offerType;

    private String offerTitle;

    private String offerDisc;

    private float offerPrice;

    private Integer offerTikatQuant;

    private String offerItems;
}
