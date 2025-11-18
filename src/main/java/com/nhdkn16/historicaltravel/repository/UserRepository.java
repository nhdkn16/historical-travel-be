package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    
}
