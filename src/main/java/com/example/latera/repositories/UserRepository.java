package com.example.latera.repositories;

import com.example.latera.models.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserModel, BigInteger> {

    boolean existsByUserName(String userName);
    Optional<UserModel> findByUserNameAndPassWord(String userName, String passWord);

}
