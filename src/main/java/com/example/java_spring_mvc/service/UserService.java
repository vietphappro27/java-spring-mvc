package com.example.java_spring_mvc.service;

import org.springframework.stereotype.Service;

import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.repository.UserRepository;

@Service
public class UserService {
    private UserRepository userRepository;
    
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handleHello() {
        return "hello from service";
    }
    public User handleSaveUser(User user){
        return this.userRepository.save(user);
    } 
}
