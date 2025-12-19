package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.entity.PostLike;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.repository.PostLikeRepository;
import com.nhdkn16.historicaltravel.repository.PostRepository;
import com.nhdkn16.historicaltravel.service.PostLikeService;

import jakarta.persistence.EntityNotFoundException;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
public class PostLikeServiceImpl implements PostLikeService {

    private final PostLikeRepository postLikeRepository;
    private final PostRepository postRepository;

    @Override
    @Transactional(readOnly = true)
    public long countLikes(Long postId) {
        return postLikeRepository.countByPost_PostId(postId);
    }

    @Override
    public boolean toggleLike(Long userId, Long postId) {
        boolean exists = postLikeRepository.existsByUser_UserIdAndPost_PostId(userId, postId);
        if (exists) {
            postLikeRepository.deleteByUser_UserIdAndPost_PostId(userId, postId);
            return false;
        } else {
            Post post = postRepository.findById(postId)
                    .orElseThrow(() -> new EntityNotFoundException("Post not found: " + postId));

            PostLike like = new PostLike();
            User u = new User();
            u.setUserId(userId);
            like.setUser(u);
            like.setPost(post);
            like.setCreatedAt(LocalDateTime.now());
            postLikeRepository.save(like);
            return true;
        }
    }

    @Override
    @Transactional(readOnly = true)
    public boolean existsLike(Long userId, Long postId) {
        return postLikeRepository.existsByUser_UserIdAndPost_PostId(userId, postId);
    }

    @Override
    public void removeLike(Long userId, Long postId) {
        postLikeRepository.deleteByUser_UserIdAndPost_PostId(userId, postId);
    }
}
