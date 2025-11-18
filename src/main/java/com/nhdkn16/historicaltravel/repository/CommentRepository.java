package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Comment;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    
}
