package com.example.java_spring_mvc.service;

import java.util.List;

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
    public void handleSaveUser(User user){
        this.userRepository.save(user);
    } 
    public List<User> getAllUser(){
        return this.userRepository.findAll();
    }
    public List<User> getAllUserByAddress(String address){
        return this.userRepository.findByAddress(address);
    }
    public User getUserById(long id){
        return this.userRepository.findById(id);
    }
}

