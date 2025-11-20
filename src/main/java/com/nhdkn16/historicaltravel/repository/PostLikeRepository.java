package com.nhdkn16.historicaltravel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.PostLike;

public interface PostLikeRepository extends JpaRepository<PostLike, Long> {
    List<PostLike> findAllPostLikeByPostId(long postId);
}
