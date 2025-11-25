package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.PostLike;

public interface PostLikeService {

    PostLike likePost(Long userId, Long postId);

    void unlikePost(Long userId, Long postId);

    List<PostLike> getLikesByPost(Long postId);

    Optional<PostLike> getUserLikeForPost(Long userId, Long postId);

    long countLikes(Long postId);
}
