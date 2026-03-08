package com.jkconverter.controller;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import java.io.File;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // Détermine le chemin absolu vers ton dossier webapp/uploads
        String uploadPath = new File("src/main/webapp/uploads/").getAbsolutePath();
        
        // Autorise l'accès public à l'URL /uploads/**
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:" + uploadPath + "/");
    }
}