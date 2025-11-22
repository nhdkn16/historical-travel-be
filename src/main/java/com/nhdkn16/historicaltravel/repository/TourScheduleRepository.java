package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.TourSchedule;

public interface TourScheduleRepository extends JpaRepository<TourSchedule, Long> {
    
}
