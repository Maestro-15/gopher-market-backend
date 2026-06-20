package com.gophermarket.common.security;

import org.junit.jupiter.api.Test;

import java.util.UUID;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

class JwtUtilTest {

    private final JwtUtil jwtUtil = new JwtUtil("test-secret-for-gopher-market-jwt");

    @Test
    void generateAccessTokenShouldValidateAndExtractClaims() {
        UUID userId = UUID.randomUUID();
        String email = "student@umn.edu";

        String token = jwtUtil.generateAccessToken(userId, email);

        assertTrue(jwtUtil.validateToken(token));
        assertEquals(userId, jwtUtil.extractUserId(token));
        assertEquals(email, jwtUtil.extractEmail(token));
    }

    @Test
    void generateRefreshTokenShouldValidateAndExtractUserId() {
        UUID userId = UUID.randomUUID();

        String token = jwtUtil.generateRefreshToken(userId);

        assertTrue(jwtUtil.validateToken(token));
        assertEquals(userId, jwtUtil.extractUserId(token));
        assertNull(jwtUtil.extractEmail(token));
    }

    @Test
    void validateTokenShouldReturnFalseForInvalidToken() {
        assertFalse(jwtUtil.validateToken("invalid.token.value"));
        assertFalse(jwtUtil.validateToken(null));
        assertFalse(jwtUtil.validateToken(""));
    }
}
