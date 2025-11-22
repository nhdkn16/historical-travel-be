package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Tour;

public interface TourRepository extends JpaRepository<Tour, Long> {
    
}
