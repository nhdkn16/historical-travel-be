package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Location;

public interface LocationRepository extends JpaRepository<Location, Long> {
    
}
