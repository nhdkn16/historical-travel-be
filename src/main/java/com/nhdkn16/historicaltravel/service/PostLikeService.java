package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.PostLike;
import com.nhdkn16.historicaltravel.repository.PostLikeRepository;

@Service
public class PostLikeService {
    private final PostLikeRepository postLikeRepository;

    public PostLikeService(PostLikeRepository postLikeRepository) {
        this.postLikeRepository = postLikeRepository;
    }

    public PostLike handleAddPostLike(PostLike postLike) {
        return this.postLikeRepository.save(postLike);
    }

    public List<PostLike> handleGetAllPostLike(long id) {
        return this.postLikeRepository.findAllPostLikeByPostId(id);
    }

    public void handleDeletePostLikeById(long id) {
        this.postLikeRepository.deleteById(id);
    } 
}
