package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.repository.PostRepository;

@Service
public class PostService {
    private final PostRepository postRepository;

    public PostService(PostRepository postRepository) {
        this.postRepository = postRepository;
    }

    public Post handleAddPost(Post post) {
        return this.postRepository.save(post);
    }

    public List<Post> handleGetAllPostByOrderByCreateAtDesc() {
        return this.postRepository.findAllByOrderByCreatedAtDesc();
    }

    public void handleDeletePostById(long id) {
        this.postRepository.deleteById(id);
    }

    public void handleDeletePostByIdAndUserId(long postId, long userId) {
        this.postRepository.deletePostByIdAndUserId(postId, userId);
    }
}
