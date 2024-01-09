package com.example.latera.DTOs;

import jakarta.validation.constraints.NotBlank;

public record CharacterDto(Integer userDBID, Integer UserClass, String userName) {
}
