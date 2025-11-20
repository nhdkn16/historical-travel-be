package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Favorite;
import com.nhdkn16.historicaltravel.repository.FavoriteRepository;

@Service
public class FavoriteService {
    private final FavoriteRepository favoriteRepository;

    public FavoriteService(FavoriteRepository favoriteRepository) {
        this.favoriteRepository = favoriteRepository;
    }

    public Favorite handleAddFavorite(Favorite favorite) {
        return this.favoriteRepository.save(favorite);
    }

    public List<Favorite> handGetAllFavorites(long id) {
        return this.favoriteRepository.findFavoriteByUserId(id);
    }

    public void handleDeleteFavoritesById(long id) {
        this.favoriteRepository.deleteById(id);
    }
}
