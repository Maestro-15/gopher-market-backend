package com.gophermarket.auth.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthHealthController {
    @GetMapping("/health")
    public String health() {
        return "auth-service ok";
    }
}