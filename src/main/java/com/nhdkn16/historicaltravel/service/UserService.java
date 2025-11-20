package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.repository.UserRepository;

@Service
public class UserService {
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User handleAddUser(User user) {
        return this.userRepository.save(user);
    }

    public List<User> handleGetAllUsers() {
        return this.userRepository.findAll();
    }

    public User handleGetUserById(long id) {
        return this.userRepository.findUserById(id);
    }

    public User handleGetUserByEmail(String email) {
        return this.userRepository.findUserByEmail(email);
    }

    public void handleDeleteUserById(long id) {
        this.userRepository.deleteById(id);
    }
}
