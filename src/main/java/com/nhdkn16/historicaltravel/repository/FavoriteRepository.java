package com.nhdkn16.historicaltravel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Favorite;

public interface FavoriteRepository extends JpaRepository<Favorite, Long> {
    public List<Favorite> findFavoriteByUserId(long id);
}
