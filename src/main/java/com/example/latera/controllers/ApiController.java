package com.example.latera.controllers;

import com.example.latera.models.game.CharacterModel;
import com.example.latera.models.game.DgCountModel;
import com.example.latera.models.web.EventModel;
import com.example.latera.repositories.game.CharacterRepository;
import com.example.latera.repositories.game.DgCountRepository;
import com.example.latera.repositories.web.EventRepository;
import com.example.latera.repositories.web.UserRepository;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.HttpStatus;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Optional;

@RestController
public class ApiController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    DgCountRepository dgCountRepository;
    @Autowired
    CharacterRepository characterRepository;


    @GetMapping(value = "/api/v1/user")
    public ResponseEntity ValidaUser(@RequestParam(value = "user") String user){
        if(userRepository.existsByUserName(user)){
            return ResponseEntity.status(HttpStatus.OK).build();
        }
        return ResponseEntity.status(HttpStatus.NOT_FOUND).build();

    }


    @GetMapping(value = "/api/v1/userdgrank")
    public ResponseEntity<List<DgCountModel>> CheckRankDgUser(@RequestParam("username") @Valid String userName, @RequestParam("continentid") @Valid Integer continentid){
        Optional<CharacterModel> character = characterRepository.findByUserName(userName);

        List<DgCountModel> dgCount = null;
        if(userName.isBlank()){
            if(continentid == 0){
                dgCount = dgCountRepository.findTopAllUsersAllDgs();
            }else{
                dgCount = dgCountRepository.findTopUsersClearByDgId(continentid);
            }

        }else{
            if(continentid == 0){
                dgCount = dgCountRepository.findAllDgsClearCountByName(userName);
            }else{
                dgCount = dgCountRepository.findDgClearCountByNameAndDgId(userName,continentid);
            }

        }

        return ResponseEntity.status(200).body(dgCount);

    }

}
