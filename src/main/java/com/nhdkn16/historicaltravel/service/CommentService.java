package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Comment;

public interface CommentService {

    Comment createComment(Comment comment);

    Comment updateComment(Long commentId, Comment comment);

    void deleteComment(Long commentId);

    Optional<Comment> getCommentById(Long commentId);

    List<Comment> getCommentsByPost(Long postId);

    List<Comment> getCommentsByLocation(Long locationId);

    List<Comment> getCommentsByUser(Long userId);

    List<Comment> getReplies(Long parentCommentId);
}
