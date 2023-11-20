package com.example.latera.controllers;

import com.example.latera.DTOs.UserRecorderDto;
import com.example.latera.Utils.Hash;
import com.example.latera.models.UserModel;
import com.example.latera.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import jakarta.websocket.Session;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.Optional;

@Controller
public class AuthController {

    @Autowired
    UserRepository userRepository;

    @PostMapping(value = "/auth/login")
    public ResponseEntity<String>  Login (@RequestBody @Valid UserRecorderDto userRecorderDto, HttpSession session, Model model){

        //var userModel = new UserModel();
        //BeanUtils.copyProperties(userRecorderDto, userModel);

        Optional<UserModel> user0 = userRepository.getUserLoginPass(userRecorderDto.userName(), Hash.Sha512(userRecorderDto.passWord()));

        if(!user0.isEmpty()){
            session.setAttribute("userid", user0.get().getAccountdbid());
            session.setAttribute("usernome", user0.get().getUserName());
            return new ResponseEntity<>( HttpStatus.OK);

        }else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    @GetMapping(value = "/auth/authenticate")
    public String Autenticate (HttpSession session, Model model){

        if(session.getAttribute("userid") != null){
            model.addAttribute("alert", "Login efetuado com sucesso!");
            return "index";

        }else{
            model.addAttribute("erro", "Falha no login, dados inválidos");
            return "index";
        }


    }

}
