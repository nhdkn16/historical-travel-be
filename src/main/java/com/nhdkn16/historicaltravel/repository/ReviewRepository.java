package com.nhdkn16.historicaltravel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findAllByUserId(long userId);
    List<Review> findAllByLocationId(long locationId);
}
