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
    
    @GetMapping("/login")
    public String getLoginPage(Model model) {
        return "user/register/login";
    }

    @GetMapping("/register")
    public String getRegisterPage(Model model) {
        return "user/register/register";
    }
    
    @GetMapping("/contact")
    public String getContactPage(Model model) {
        return "user/contact/contact";
    }
    
    @GetMapping("/social")
    public String getSocialPage(Model model) {
        return "user/socialNetwork/social";
    }
    
    @GetMapping("/service")
    public String getServicePage(Model model) {
        return "user/location/service";
    }
}
