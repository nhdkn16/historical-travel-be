package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Post;

public interface PostRepository extends JpaRepository<Post, Long> {
    
}
