package com.nhdkn16.historicaltravel.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhdkn16.historicaltravel.entity.Post;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.service.LocationService;
import com.nhdkn16.historicaltravel.service.PostService;
import com.nhdkn16.historicaltravel.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin/post")
@RequiredArgsConstructor
public class AdminPostController {

    private final PostService postService;
    private final LocationService locationService;
    private final UserService userService;

    @GetMapping
    public String index(Model model) {
        model.addAttribute("posts", postService.getAllPosts());
        model.addAttribute("locations", locationService.getAllLocations());
        model.addAttribute("postForm", new Post());
        return "admin/posts";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute("postForm") Post post, Principal principal) {
        User user = userService.findByUsername(principal.getName()).orElseThrow(() -> new RuntimeException("User not found"));
        post.setUser(user);
        postService.createPost(post);
        return "redirect:/admin/post";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute Post post) {
        postService.updatePost(id, post);
        return "redirect:/admin/post";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        postService.deletePost(id);
        return "redirect:/admin/post";
    }
}

