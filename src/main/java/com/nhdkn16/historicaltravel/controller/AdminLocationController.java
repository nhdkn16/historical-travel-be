package com.nhdkn16.historicaltravel.controller;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.service.LocationService;

import lombok.RequiredArgsConstructor;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/location")
@RequiredArgsConstructor
public class AdminLocationController {

    private final LocationService locationService;

    @GetMapping
    public String list(Model model, Principal principal) {
        model.addAttribute("locations", locationService.getAllLocations());
        model.addAttribute("types", Location.LocationType.values());
        model.addAttribute("statuses", Location.Status.values());
        return "admin/locations";
    }

    @PostMapping("/create")
    public String create(@ModelAttribute Location location) {
        locationService.createLocation(location);
        return "redirect:/admin/location";
    }

    @PostMapping("/update/{id}")
    public String update(@PathVariable Long id, @ModelAttribute Location location) {
        locationService.updateLocation(id, location);
        return "redirect:/admin/location";
    }

    @PostMapping("/delete/{id}")
    public String delete(@PathVariable Long id) {
        locationService.deleteLocation(id);
        return "redirect:/admin/location";
    }

    @GetMapping("/search")
    public String search(@RequestParam String keyword, Model model) {
        model.addAttribute("locations", locationService.search(keyword));
        model.addAttribute("types", Location.LocationType.values());
        model.addAttribute("statuses", Location.Status.values());
        return "admin/locations";
    }
}
