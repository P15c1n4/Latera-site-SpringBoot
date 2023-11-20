package com.example.latera.repositories;

import com.example.latera.models.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<UserModel, BigInteger> {

    boolean existsByUserNameAndPassWord(String userName, String passWord);

    @Query(nativeQuery = true, value="" +
            "SELECT accountdbid, userName, passWord, email FROM account_info " +
            "WHERE userName = :userName AND passWord = :passWord")
    Optional<UserModel> getUserLoginPass(String userName, String passWord);

}
