package com.example.latera.DTOs;

import jakarta.validation.constraints.NotBlank;

public record UserLoginDto(@NotBlank String userName, @NotBlank String passWord, String email) {
}
