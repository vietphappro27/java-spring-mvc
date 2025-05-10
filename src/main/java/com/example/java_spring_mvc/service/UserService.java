package com.example.java_spring_mvc.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.example.java_spring_mvc.domain.Role;
import com.example.java_spring_mvc.domain.User;
import com.example.java_spring_mvc.repository.RoleRepository;
import com.example.java_spring_mvc.repository.UserRepository;

@Service
public class UserService {
    private UserRepository userRepository;
    private RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    public void handleSaveUser(User newUser) {
        this.userRepository.save(newUser);
    }

    public void handleDeleteUser(User user) {
        this.userRepository.deleteById(user.getId());
    }

    public List<User> getAllUser() {
        return this.userRepository.findAll();
    }

    public List<User> getAllUserByAddress(String address) {
        return this.userRepository.findByAddress(address);
    }

    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }
}
