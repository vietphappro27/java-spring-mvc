package com.example.java_spring_mvc.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.java_spring_mvc.domain.User;

// CRUD: create, read, update, delete
@Repository
public interface UserRepository extends CrudRepository<User,Long>{
    User save(User vietphap);
    
}