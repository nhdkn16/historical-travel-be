package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Favorite;

public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    
}
