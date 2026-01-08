package com.nhdkn16.historicaltravel.controller;

import com.nhdkn16.historicaltravel.dto.response.LikeResponse;
import com.nhdkn16.historicaltravel.entity.*;
import com.nhdkn16.historicaltravel.repository.*;
import com.nhdkn16.historicaltravel.service.UserService;
import lombok.RequiredArgsConstructor;

import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Principal;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Controller
@RequiredArgsConstructor
@RequestMapping("/social")
public class SocialController {

    private final PostRepository postRepository;
    private final ImageRepository imageRepository;
    private final PostLikeRepository postLikeRepository;
    private final UserService userService;

    @GetMapping
    public String socialPage(Model model, Principal principal) {
        List<Post> posts = postRepository.findByStatusOrderByCreatedAtDesc(Post.Status.PUBLISHED);

        for (Post p : posts) {
            List<Image> images = imageRepository.findByTargetTypeAndTargetId(Image.TargetType.POST, p.getPostId());
            p.setTempImages(images);
            p.setLikeCount(postLikeRepository.countByPost_PostId(p.getPostId()));
        }

        Optional<User> optionalUser = userService.getLoggedInUser();
        User loggedInUser = optionalUser.orElse(null);
        model.addAttribute("loggedInUser", loggedInUser);

        if (principal != null) {
            Optional<User> optUser = userService.findByUsername(principal.getName());
            model.addAttribute("user", optUser.orElse(null));
        } else {
            model.addAttribute("user", null);
        }

        model.addAttribute("posts", posts);
        model.addAttribute("user", userService.getLoggedInUser().orElse(null));

        return "user/socialNetwork/social";
    }

    @PostMapping("/post")
    public String createPost(@RequestParam String title,
                             @RequestParam String content,
                             @RequestParam(required = false) MultipartFile[] images,
                             Principal principal) {

        if (principal == null) {
            return "redirect:/login";
        }

        User user = userService.findByUsername(principal.getName()).orElseThrow(() -> new IllegalStateException("User not found"));

        Post post = new Post();
        post.setUser(user);
        post.setTitle(title);
        post.setContent(content);
        post.setStatus(Post.Status.PUBLISHED);
        post.setCreatedAt(LocalDateTime.now());

        Post savedPost = postRepository.save(post);

        if (images != null) {
            int order = 0;
            for (MultipartFile file : images) {
                if (!file.isEmpty()) {
                    Image img = new Image();
                    img.setTargetType(Image.TargetType.POST);
                    img.setTargetId(savedPost.getPostId());
                    img.setImageUrl("/uploads/" + file.getOriginalFilename());
                    img.setImageOrder(order++);
                    img.setUploadedAt(LocalDateTime.now());
                    imageRepository.save(img);
                }
            }
        }

        return "redirect:/social";
    }

    @PostMapping("/like")
    @ResponseBody
    public LikeResponse toggleLikeAjax(
            @RequestParam Long postId,
            Principal principal) {

        if (principal == null) {
            throw new RuntimeException("UNAUTHORIZED");
        }

        User user = userService.findByUsername(principal.getName())
                .orElseThrow(() -> new IllegalStateException("User not found"));

        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalStateException("Post not found"));

        PostLike existingLike = postLikeRepository
                .findByUser_UserIdAndPost_PostId(user.getUserId(), postId)
                .orElse(null);

        boolean liked;

        if (existingLike != null) {
            postLikeRepository.delete(existingLike);
            liked = false;
        } else {
            PostLike like = new PostLike();
            like.setUser(user);
            like.setPost(post);
            like.setCreatedAt(LocalDateTime.now());
            postLikeRepository.save(like);
            liked = true;
        }

        long likeCount = postLikeRepository.countByPost_PostId(postId);

        return new LikeResponse(liked, likeCount);
    }

    @GetMapping("/like/{postId}")
    public String toggleLikePost(@PathVariable Long postId, Principal principal) {
        if (principal == null) {
            return "redirect:/login";
        }

        User user = userService.findByUsername(principal.getName())
                .orElseThrow(() -> new IllegalStateException("User not found"));

        Post post = postRepository.findById(postId)
                .orElseThrow(() -> new IllegalStateException("Post not found: " + postId));

        PostLike existingLike = postLikeRepository
                .findByUser_UserIdAndPost_PostId(user.getUserId(), postId)
                .orElse(null);

        if (existingLike != null) {
            postLikeRepository.delete(existingLike);
        } else {
            PostLike like = new PostLike();
            like.setUser(user);
            like.setPost(post);
            like.setCreatedAt(LocalDateTime.now());
            postLikeRepository.save(like);
        }

        return "redirect:/social";
    }

    @GetMapping("/image")
    @ResponseBody
    public ResponseEntity<Resource> serveImage(@RequestParam("path") String path) throws IOException {
        File file = new File(path);
        if (!file.exists() || !file.isFile()) {
            return ResponseEntity.notFound().build();
        }

        Path filePath = file.toPath();
        Resource resource = new UrlResource(filePath.toUri());
        String contentType = Files.probeContentType(filePath);

        return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType)).body(resource);
    }
}
