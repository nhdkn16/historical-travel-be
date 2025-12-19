package com.nhdkn16.historicaltravel.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.service.LocationService;
import com.nhdkn16.historicaltravel.service.TourService;
import com.nhdkn16.historicaltravel.service.UserService;

@Controller
@RequestMapping("/location")
public class LocationController {

    @Autowired
    private LocationService locationService;

    @Autowired
    private TourService tourService;

    @Autowired
    private UserService userService;

    @GetMapping("/detail/{id}")
    public String getDetailLocationPage(@PathVariable("id") Long id, Model model, Principal principal) {
        Optional<Location> locationOpt = locationService.getLocationById(id);
        if (locationOpt.isEmpty())
            return "redirect:/";

        Location location = locationOpt.get();
        List<Tour> tours = tourService.getToursByLocation(location.getLocationId());

        Optional<User> optionalUser = userService.getLoggedInUser();
        User loggedInUser = optionalUser.orElse(null);
        model.addAttribute("loggedInUser", loggedInUser);

        if (principal != null) {
            Optional<User> optUser = userService.findByUsername(principal.getName());
            model.addAttribute("user", optUser.orElse(null));
        } else {
            model.addAttribute("user", null);
        }

        model.addAttribute("location", location);
        model.addAttribute("tours", tours);
        return "user/location/detail";
    }
}