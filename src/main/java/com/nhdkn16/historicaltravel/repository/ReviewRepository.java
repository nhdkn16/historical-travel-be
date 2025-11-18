package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Review;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    
}
