package com.example.latera.DTOs;

import jakarta.validation.constraints.NotBlank;


public record UserRecorderDto(@NotBlank String userName, @NotBlank String passWord, @NotBlank String email) {
}
