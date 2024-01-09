package com.example.latera.repositories.web;

import com.example.latera.models.web.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserModel, BigInteger> {

    boolean existsByUserName(String userName);
    Optional<UserModel> findByUserNameAndPassWord(String userName, String passWord);


    @Query(nativeQuery = true, value = "INSERT INTO account_info ( userName, passWord, email) values(:userName,:passWord,:email)")
    void registerUserAccount
            (@Param("userName") String userName,@Param("passWord") String passWord,@Param("email") String email);

}
