package com.nhdkn16.historicaltravel.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.entity.User.Status;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);

    Optional<User> findByUsername(String username);

    Optional<User> findByEmailOrUsername(String email, String username);

    boolean existsByEmail(String email);

    boolean existsByUsername(String username);

    Long countByStatus(Status status);

    long count();
}
