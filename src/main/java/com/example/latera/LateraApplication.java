package com.example.latera;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class LateraApplication {

	public static void main(String[] args) {
		SpringApplication.run(LateraApplication.class, args);

		System.out.println(new BCryptPasswordEncoder().encode("teste"));
	}

}
