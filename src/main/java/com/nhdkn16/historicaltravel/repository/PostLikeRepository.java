package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.entity.PostLike;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;
import java.util.Optional;

public interface PostLikeRepository extends JpaRepository<PostLike, Long> {

    Optional<PostLike> findByUserAndPost(User user, Post post);

    boolean existsByUserAndPost(User user, Post post);

    List<PostLike> findByPost(Post post);

    void deleteByUserAndPost(User user, Post post);
}
