package com.nhdkn16.historicaltravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping("/profile")
public class ProfileController {
    @GetMapping
    public String profile(Model model) {
        return "user/socialNetwork/profile";
    }
    
}
