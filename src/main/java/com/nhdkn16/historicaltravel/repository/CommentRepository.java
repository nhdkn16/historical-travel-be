package com.nhdkn16.historicaltravel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    public List<Comment> findAllCommentsByPostId(long postId);
    public List<Comment> findAllCommentsByUserId(long userId);
}
