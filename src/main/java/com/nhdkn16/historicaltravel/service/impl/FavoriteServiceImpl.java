package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Favorite;
import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.repository.FavoriteRepository;
import com.nhdkn16.historicaltravel.repository.LocationRepository;
import com.nhdkn16.historicaltravel.repository.UserRepository;
import com.nhdkn16.historicaltravel.service.FavoriteService;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class FavoriteServiceImpl implements FavoriteService {

    private final FavoriteRepository favoriteRepository;
    private final UserRepository userRepository;
    private final LocationRepository locationRepository;

    @Override
    public Favorite addFavorite(Long userId, Long locationId) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Location location = locationRepository.findById(locationId)
                .orElseThrow(() -> new RuntimeException("Location not found"));

        // Check UNIQUE(user_id, location_id)
        if (favoriteRepository.existsByUserAndLocation(user, location)) {
            throw new RuntimeException("This location is already in favorites.");
        }

        Favorite favorite = Favorite.builder()
                .user(user)
                .location(location)
                .build();

        return favoriteRepository.save(favorite);
    }

    @Override
    public void removeFavorite(Long userId, Long locationId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Location location = locationRepository.findById(locationId)
                .orElseThrow(() -> new RuntimeException("Location not found"));

        if (!favoriteRepository.existsByUserAndLocation(user, location)) {
            throw new RuntimeException("Favorite not found");
        }

        favoriteRepository.deleteByUserAndLocation(user, location);
    }

    @Override
    public List<Favorite> getFavoritesByUser(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        return favoriteRepository.findByUser(user);
    }

    @Override
    public Optional<Favorite> getUserFavoriteForLocation(Long userId, Long locationId) {

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Location location = locationRepository.findById(locationId)
                .orElseThrow(() -> new RuntimeException("Location not found"));

        return favoriteRepository.findByUserAndLocation(user, location);
    }
}