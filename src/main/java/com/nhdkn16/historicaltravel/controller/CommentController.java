package com.nhdkn16.historicaltravel.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nhdkn16.historicaltravel.dto.response.CommentResponse;
import com.nhdkn16.historicaltravel.entity.Comment;
import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.service.CommentService;
import com.nhdkn16.historicaltravel.service.PostService;
import com.nhdkn16.historicaltravel.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/comments")
@RequiredArgsConstructor
public class CommentController {

    private final CommentService commentService;
    private final PostService postService;
    private final UserService userService;

    @PostMapping("/add")
    public String addComment(@RequestParam Long postId, @RequestParam String content) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated() || auth.getPrincipal().equals("anonymousUser")) {
            return "redirect:/login";
        }

        String username = auth.getName();
        User user = userService.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Post post = postService.getPostById(postId)
                .orElseThrow(() -> new RuntimeException("Post not found"));

        Comment comment = Comment.builder()
                .user(user)
                .post(post)
                .content(content)
                .status(Comment.Status.ACTIVE)
                .build();

        commentService.createComment(comment);
        return "redirect:/social";
    }

    @PostMapping("/add2")
    @ResponseBody
    public Map<String, Object> addCommentAjax(
            @RequestParam Long postId,
            @RequestParam String content) {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated()
                || auth.getPrincipal().equals("anonymousUser")) {
            throw new RuntimeException("UNAUTHORIZED");
        }

        String username = auth.getName();
        User user = userService.findByUsername(username)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Post post = postService.getPostById(postId)
                .orElseThrow(() -> new RuntimeException("Post not found"));

        Comment comment = Comment.builder()
                .user(user)
                .post(post)
                .content(content)
                .status(Comment.Status.ACTIVE)
                .build();

        Comment saved = commentService.createComment(comment);

        Map<String, Object> res = new HashMap<>();
        res.put("commentId", saved.getCommentId());
        res.put("username", user.getUsername());
        res.put("content", saved.getContent());
        res.put("userId", user.getUserId());

        return res;
    }

    @GetMapping("/{postId}")
    @ResponseBody
    public List<CommentResponse> getComments(@PathVariable Long postId) {

        List<Comment> comments = commentService
                .findActiveCommentsByPostId(postId);

        return comments.stream().map(c ->
            new CommentResponse(
                c.getCommentId(),
                c.getUser().getUsername(),
                c.getContent(),
                c.getUser().getUserId()
            )
        ).toList();
    }

    @PostMapping("/edit")
    @ResponseBody
    public Map<String, Object> editCommentAjax(@RequestParam Long commentId, @RequestParam String content) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated()
                || auth.getPrincipal().equals("anonymousUser")) {
            throw new RuntimeException("UNAUTHORIZED");
        }

        Comment comment = commentService.getCommentById(commentId)
                .orElseThrow(() -> new RuntimeException("Comment not found"));

        if (!comment.getUser().getUsername().equals(auth.getName())) {
            throw new AccessDeniedException("Forbidden");
        }

        comment.setContent(content);
        Comment updated = commentService.updateComment(commentId, comment);

        Map<String, Object> res = new HashMap<>();
        res.put("commentId", updated.getCommentId());
        res.put("content", updated.getContent());

        return res;
    }

    @PostMapping("/delete")
    @ResponseBody
    public Map<String, Object> deleteCommentAjax(@RequestParam Long commentId) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth == null || !auth.isAuthenticated()
                || auth.getPrincipal().equals("anonymousUser")) {
            throw new RuntimeException("UNAUTHORIZED");
        }

        Comment comment = commentService.getCommentById(commentId)
                .orElseThrow(() -> new RuntimeException("Comment not found"));

        if (!comment.getUser().getUsername().equals(auth.getName())) {
            throw new AccessDeniedException("Forbidden");
        }

        commentService.deleteComment(commentId);

        return Map.of("success", true);
    }
}
