package com.nhdkn16.historicaltravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import ch.qos.logback.core.model.Model;

@Controller
public class AdminController {

    @GetMapping("/admin")
    public String getAdminPage(Model model) {
        return "admin/admin";
    }

    @GetMapping("/admin/comment")
    public String getAdminCommentPage(Model model) {
        return "admin/comments";
    }

    @GetMapping("/admin/location")
    public String getAdminLocationPage(Model model) {
        return "admin/locations";
    }

    @GetMapping("/admin/post")
    public String getAdminPostPage(Model model) {
        return "admin/posts";
    }
    
    @GetMapping("/admin/user")
    public String getAdminUserPage(Model model) {
        return "admin/users";
    }
}
