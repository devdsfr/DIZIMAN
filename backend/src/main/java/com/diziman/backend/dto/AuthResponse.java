package com.diziman.backend.dto;

public record AuthResponse(String token, String username, String name, String role) {}
