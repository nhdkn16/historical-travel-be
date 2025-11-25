package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Favorite;

public interface FavoriteService {

    Favorite addFavorite(Long userId, Long locationId);

    void removeFavorite(Long userId, Long locationId);

    List<Favorite> getFavoritesByUser(Long userId);

    Optional<Favorite> getUserFavoriteForLocation(Long userId, Long locationId);
}
