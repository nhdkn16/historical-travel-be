package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Review;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;
import java.util.Optional;

public interface ReviewRepository extends JpaRepository<Review, Long> {

    List<Review> findByLocation(Location location);

    List<Review> findByUser(User user);

    Optional<Review> findByUserAndLocation(User user, Location location);

    boolean existsByUserAndLocation(User user, Location location);
}