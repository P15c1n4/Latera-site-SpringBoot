package com.example.latera.controllers;

import com.example.latera.DTOs.UserLoginDto;
import com.example.latera.DTOs.UserRecorderDto;
import com.example.latera.Utils.Hash;
import com.example.latera.models.UserModel;
import com.example.latera.repositories.UserRepository;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.Optional;

@Controller
public class AuthController {

    @Autowired
    UserRepository userRepository;

    @PostMapping(value = "/auth/login")
    public ResponseEntity<String>  Login (@RequestBody @Valid UserLoginDto userLoginDto, HttpSession session, Model model){

        Optional<UserModel> user0 = userRepository.findByUserNameAndPassWord(userLoginDto.userName(), Hash.Sha512(userLoginDto.passWord()));

        if(!user0.isEmpty()){
            session.setAttribute("userid", user0.get().getAccountdbid());
            session.setAttribute("usernome", user0.get().getUserName());
            return ResponseEntity.status(HttpStatus.OK).build();

        }else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).build();
        }
    }

    @PutMapping(value = "/auth/register")
    public ResponseEntity  Register(@RequestBody @Valid UserRecorderDto userRecorderDto, HttpSession session){

        if(userRepository.existsByUserName(userRecorderDto.userName())){
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).build();
        }

        var userModel = new UserModel();
        BeanUtils.copyProperties(userRecorderDto, userModel);
        userModel.setPassWord(Hash.Sha512(userRecorderDto.passWord()));

        UserModel userModel0 = userRepository.save(userModel);
        
        session.setAttribute("userid", userModel0.getAccountdbid());
        session.setAttribute("usernome", userModel0.getUserName());

        return ResponseEntity.status(HttpStatus.CREATED).build();
    }



    @GetMapping(value = "/auth/logout")
    public String logout (HttpSession session){

        session.invalidate();

        return "redirect:/";
    }

}
