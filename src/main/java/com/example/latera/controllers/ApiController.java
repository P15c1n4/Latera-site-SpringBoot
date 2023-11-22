package com.example.latera.controllers;

import com.example.latera.repositories.UserRepository;
import jakarta.ws.rs.PathParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;

@RestController
public class ApiController {

    @Autowired
    UserRepository userRepository;

    @GetMapping(value = "/api/v1/user")
    public ResponseEntity ValidaUser(@PathParam(value = "user") String user){

        if(userRepository.existsByUserName(user)){
            return ResponseEntity.status(HttpStatus.OK).build();
        }

        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }

}
