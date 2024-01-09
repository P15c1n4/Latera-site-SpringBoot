package com.example.latera.repositories.web;

import com.example.latera.models.web.OffertModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface OfertRepository extends JpaRepository<OffertModel, Integer> {


    OffertModel findById(short id);

    List<OffertModel> findAllByOfferType(short type);

    List<OffertModel> findAll();

}
