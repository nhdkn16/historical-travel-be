package com.nhdkn16.historicaltravel.service;

public interface PostLikeService {

    long countLikes(Long postId);

    boolean toggleLike(Long userId, Long postId);

    boolean existsLike(Long userId, Long postId);

    void removeLike(Long userId, Long postId);
}
