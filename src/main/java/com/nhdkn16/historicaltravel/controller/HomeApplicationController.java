package com.nhdkn16.historicaltravel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import ch.qos.logback.core.model.Model;

@Controller
public class HomeApplicationController {
    
    @GetMapping("/")
    public String getHomePage(Model model) {
        return "home";
    }
    
}
