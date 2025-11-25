package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Review;

public interface ReviewService {

    Review createReview(Review review);

    Review updateReview(Long id, Review review);

    void deleteReview(Long id);

    Optional<Review> getReviewById(Long id);

    List<Review> getReviewsByLocation(Long locationId);

    List<Review> getReviewsByUser(Long userId);

    Optional<Review> getUserReviewForLocation(Long userId, Long locationId);
}
