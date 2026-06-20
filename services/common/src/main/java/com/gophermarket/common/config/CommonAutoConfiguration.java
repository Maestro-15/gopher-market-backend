package com.gophermarket.common.config;

import com.gophermarket.common.exception.GlobalExceptionHandler;
import com.gophermarket.common.security.JwtUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.context.annotation.Bean;

@AutoConfiguration
public class CommonAutoConfiguration {

    @Bean
    @ConditionalOnMissingBean
    public GlobalExceptionHandler globalExceptionHandler() {
        return new GlobalExceptionHandler();
    }

    @Bean
    @ConditionalOnMissingBean
    @ConditionalOnProperty(name = "jwt.secret")
    public JwtUtil jwtUtil(@Value("${jwt.secret}") String secret) {
        return new JwtUtil(secret);
    }
}
