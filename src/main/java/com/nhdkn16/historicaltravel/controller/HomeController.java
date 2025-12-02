package com.nhdkn16.historicaltravel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.service.LocationService;



@Controller
public class HomeController {

    @Autowired
    private LocationService locationService;
    
    @GetMapping("/")
    public String getHomePage(Model model) {
        List<Location> latestLocations = locationService.getLatestLocations();
        model.addAttribute("locations", latestLocations);
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
