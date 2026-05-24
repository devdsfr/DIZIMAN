package com.diziman.backend.controller;

import com.diziman.backend.dto.AuthRequest;
import com.diziman.backend.dto.AuthResponse;
import com.diziman.backend.security.JwtUtil;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
@RequestMapping("/api/auth")
public class AuthController {

    // Mapeamento de username → nome de exibição e perfil
    private static final Map<String, String[]> USER_INFO = Map.of(
            "admin",  new String[]{"Administrador", "admin"},
            "pastor", new String[]{"Pastor",         "user"},
            "lider",  new String[]{"Líder",           "user"}
    );

    private final AuthenticationManager authManager;
    private final JwtUtil jwtUtil;

    public AuthController(AuthenticationManager authManager, JwtUtil jwtUtil) {
        this.authManager = authManager;
        this.jwtUtil = jwtUtil;
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody AuthRequest request) {
        try {
            authManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.username(), request.password())
            );
        } catch (BadCredentialsException e) {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED)
                    .body(Map.of("error", "Usuário ou senha incorretos."));
        }

        String token = jwtUtil.generateToken(request.username());
        String[] info = USER_INFO.getOrDefault(request.username(), new String[]{request.username(), "user"});

        return ResponseEntity.ok(new AuthResponse(token, request.username(), info[0], info[1]));
    }
}
