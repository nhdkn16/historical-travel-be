package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Favorite;
import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;
import java.util.Optional;

public interface FavoriteRepository extends JpaRepository<Favorite, Long> {

    List<Favorite> findByUser(User user);

    Optional<Favorite> findByUserAndLocation(User user, Location location);

    boolean existsByUserAndLocation(User user, Location location);

    void deleteByUserAndLocation(User user, Location location);
}
