package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Comment;
import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findByPost(Post post);

    List<Comment> findByLocation(Location location);

    List<Comment> findByUser(User user);

    List<Comment> findByParentComment(Comment parentComment);

    List<Comment> findByPost_PostIdOrderByCreatedAtAsc(Long postId);

    List<Comment> findByLocation_LocationIdOrderByCreatedAtAsc(Long locationId);

    List<Comment> findByParentComment_CommentId(Long parentCommentId);

    List<Comment> findByUser_UserIdOrderByCreatedAtDesc(Long userId);

    long count();
}
