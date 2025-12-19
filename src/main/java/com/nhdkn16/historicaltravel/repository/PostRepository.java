package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.entity.Post.Status;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {

    List<Post> findByUser(User user);

    List<Post> findByLocation(Location location);

    List<Post> findByUserAndStatus(User user, Status status);

    List<Post> findByTitleContainingIgnoreCase(String keyword);

    List<Post> findByStatus(Post.Status status);

    List<Post> findByTitleContainingIgnoreCaseAndStatus(
            String keyword, Post.Status status);

    @Query("SELECT p FROM Post p ORDER BY p.createdAt DESC")
    List<Post> findAllWithImages();

    List<Post> findByUser_UserId(Long userId);

    List<Post> findByStatus(String status);

    List<Post> findByStatusOrderByCreatedAtDesc(Post.Status status);

    long count();
}
