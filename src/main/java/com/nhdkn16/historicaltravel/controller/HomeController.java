package com.nhdkn16.historicaltravel.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.service.LocationService;
import com.nhdkn16.historicaltravel.service.UserService;



@Controller
public class HomeController {

    @Autowired
    private LocationService locationService;
    @Autowired
    private UserService userService;
    
    @GetMapping("/")
    public String getHomePage(Model model, Principal principal) {
        List<Location> latestLocations = locationService.getLatestLocations();
        model.addAttribute("locations", latestLocations);
        
        Optional<User> optionalUser = userService.getLoggedInUser();
        User loggedInUser = optionalUser.orElse(null);
        model.addAttribute("loggedInUser", loggedInUser);

        if (principal != null) {
            Optional<User> optUser = userService.findByUsername(principal.getName());
            model.addAttribute("user", optUser.orElse(null));
        } else {
            model.addAttribute("user", null);
        }

        return "home";
    }
    
    @GetMapping("/contact")
    public String getContactPage(Model model) {
        return "user/contact/contact";
    }
}
