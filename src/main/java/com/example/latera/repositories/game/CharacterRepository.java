package com.example.latera.repositories.game;

import com.example.latera.models.game.CharacterModel;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.Optional;
@Repository
public interface CharacterRepository extends JpaRepository<CharacterModel, BigInteger> {

    Optional<CharacterModel> findByUserName(String userName);


}
