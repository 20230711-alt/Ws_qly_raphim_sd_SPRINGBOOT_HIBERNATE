package com.cinebook;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"com.cinebook", "com.example.demo"})
public class CinebookApplication {
    public static void main(String[] args) {
        SpringApplication.run(CinebookApplication.class, args);
    }
}