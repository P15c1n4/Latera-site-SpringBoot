package com.example.latera.DTOs;

import jakarta.validation.constraints.NotNull;

public record EventDto(Integer id, @NotNull short eventType, String eventTitle, String eventText, String eventAutor, String eventTime) {
}
