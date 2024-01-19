package com.howtodoinjava.demo.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.howtodoinjava.demo.exception.RecordNotFoundException;
import com.howtodoinjava.demo.model.EmployeeEntity;
import com.howtodoinjava.demo.service.EmployeeService;
 
@RestController
public class EmployeeController
{
    @Autowired
    EmployeeService service;
    @GetMapping
    public String hello() {
        return "this is my Java app";
    }
    @GetMapping("/ping")
    public String ping() {
        return "Pong!";
    }

    @GetMapping("/user/{id}")
    public EmployeeEntity getUserById(@PathVariable Long id) throws RecordNotFoundException {
        return service.getEmployeeById(id);
    }

    @GetMapping("/users")
    public List<EmployeeEntity> getAllUsers() {
        return service.getAllEmployees();
    }

    @PostMapping("/user")
    public EmployeeEntity editUser(@RequestBody EmployeeEntity user) throws RecordNotFoundException {
        // Save or update the user in the database
        return service.createOrUpdateEmployee(user);
    }

    @PostMapping("/auth/login")
    public String login() {
        // Your login logic here
        return "Login successful!";
    }
 
}