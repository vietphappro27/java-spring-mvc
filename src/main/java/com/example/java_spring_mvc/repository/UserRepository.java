package com.example.java_spring_mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.example.java_spring_mvc.domain.User;
import java.util.List;


// CRUD: create, read, update, delete
@Repository
public interface UserRepository extends JpaRepository<User,Long>{
    User save(User vietphap);
    List<User> findByAddress(String address);
    User findById(long id);
    
}