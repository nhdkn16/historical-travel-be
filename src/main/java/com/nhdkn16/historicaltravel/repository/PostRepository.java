package com.nhdkn16.historicaltravel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
    List<Post> findAllByOrderByCreatedAtDesc();
    void deletePostByIdAndUserId(long postId, long userId);
}
