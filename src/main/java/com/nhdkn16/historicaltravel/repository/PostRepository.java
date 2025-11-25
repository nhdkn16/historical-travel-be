package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.entity.Post.Status;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {

    List<Post> findByUser(User user);

    List<Post> findByLocation(Location location);

    List<Post> findByStatus(Status status);

    List<Post> findByUserAndStatus(User user, Status status);
}
