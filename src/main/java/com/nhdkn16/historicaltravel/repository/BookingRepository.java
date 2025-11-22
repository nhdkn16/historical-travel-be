package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Booking;

public interface BookingRepository extends JpaRepository<Booking, Long> {
    
}
