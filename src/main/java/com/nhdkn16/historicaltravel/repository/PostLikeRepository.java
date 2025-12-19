package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.PostLike;

import java.util.Optional;

public interface PostLikeRepository extends JpaRepository<PostLike, Long> {

    boolean existsByUser_UserIdAndPost_PostId(Long userId, Long postId);

    long countByPost_PostId(Long postId);

    Optional<PostLike> findByUser_UserIdAndPost_PostId(Long userId, Long postId);

    void deleteByUser_UserIdAndPost_PostId(Long userId, Long postId);
}
