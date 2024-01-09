package com.example.latera.DTOs;

import jakarta.validation.constraints.NotNull;

public record EventDto(@NotNull short eventType) {
}
