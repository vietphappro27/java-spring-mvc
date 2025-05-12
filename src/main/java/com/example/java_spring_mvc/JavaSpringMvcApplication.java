package com.example.java_spring_mvc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

// exclude Security
// @SpringBootApplication(exclude = org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class)
@SpringBootApplication
public class JavaSpringMvcApplication {

	public static void main(String[] args) {
		SpringApplication.run(JavaSpringMvcApplication.class, args);
	}

}
