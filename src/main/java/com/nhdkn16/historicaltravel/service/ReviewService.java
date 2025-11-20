package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Review;
import com.nhdkn16.historicaltravel.repository.ReviewRepository;

@Service
public class ReviewService {
    private final ReviewRepository reviewRepository;

    public ReviewService(ReviewRepository reviewRepository) {
        this.reviewRepository = reviewRepository;
    }

    public Review handleAddReview(Review review) {
        return this.reviewRepository.save(review);
    }

    public List<Review> handleGetAllReviewsByUserId(long id) {
        return this.reviewRepository.findAllByUserId(id);
    }

    public List<Review> handleGetAllReviewsByLocationId(long id) {
        return this.reviewRepository.findAllByLocationId(id);
    }

    public void handleDeleteReviewById(long id) {
        this.reviewRepository.deleteById(id);
    }
}
