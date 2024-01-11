package com.example.latera.repositories.web;

import com.example.latera.models.web.EventModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface EventRepository extends JpaRepository<EventModel, Integer> {

    @Query(nativeQuery = true, value = "SELECT * FROM evntsinfo WHERE eventType = :eventType ORDER BY eventTime DESC")
    List<EventModel> findAllByEventTypeOrderByIdDesc(@Param(value = "eventType") short eventType);
    @Query(nativeQuery = true, value = "SELECT * FROM evntsinfo WHERE eventType = :eventType ORDER BY eventTime DESC LIMIT 6")
    List<EventModel> findTop5ByEventTypeOrderByIdDesc(@Param(value = "eventType") short eventType);

    @Query(nativeQuery = true, value = "SELECT * FROM evntsinfo ORDER BY eventTime DESC LIMIT 6")
    List<EventModel> findTop5OrderByIdDesc();

    Optional<EventModel> findById(short id);
}
