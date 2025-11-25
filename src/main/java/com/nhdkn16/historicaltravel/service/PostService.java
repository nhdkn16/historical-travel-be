package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Post;

public interface PostService {

    Post createPost(Post post);

    Post updatePost(Long postId, Post updatedPost);

    void deletePost(Long postId);

    Optional<Post> getPostById(Long postId);

    List<Post> getAllPosts();

    List<Post> getPostsByUser(Long userId);

    List<Post> getPostsByLocation(Long locationId);

    Post increaseViewCount(Long postId);
}
