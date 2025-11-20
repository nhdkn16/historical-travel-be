package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Comment;
import com.nhdkn16.historicaltravel.repository.CommentRepository;

@Service
public class CommentService {
    private final CommentRepository commentRepository;

    public CommentService(CommentRepository commentRepository) {
        this.commentRepository = commentRepository;
    }

    public Comment handleAddComment(Comment comment) {
        return this.commentRepository.save(comment);
    }

    public List<Comment> handleGetAllCommentsByPostId(long id) {
        return this.commentRepository.findAllCommentsByPostId(id);
    }

    public List<Comment> handleGetAllCommentsByUserId(long id) {
        return this.commentRepository.findAllCommentsByUserId(id);
    }

    public void handleDeleteCommentById(long id) {
        this.commentRepository.deleteById(id);
    }
}
