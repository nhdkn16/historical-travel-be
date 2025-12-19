package com.nhdkn16.historicaltravel.controller;

import java.security.Principal;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nhdkn16.historicaltravel.dto.request.AdminDashboardStatsRequest;
import com.nhdkn16.historicaltravel.service.AdminDashboardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@PreAuthorize("hasRole('ADMIN')")
public class AdminController {

    private final AdminDashboardService dashboardService;

    @GetMapping
    public String dashboard(Model model, Principal principal) throws Exception{

        String adminName = (principal != null) ? principal.getName() : "Admin";

        model.addAttribute("adminName", adminName);

        AdminDashboardStatsRequest stats = dashboardService.getDashboardStats();

        ObjectMapper mapper = new ObjectMapper();

        model.addAttribute("stats", stats);
        model.addAttribute("chartLabelsJson", mapper.writeValueAsString(stats.getChartLabels()));
        model.addAttribute("chartValuesJson", mapper.writeValueAsString(stats.getChartValues()));

        return "admin/admin";
    }

    @GetMapping("/comment")
    public String getAdminCommentPage(Model model) {
        return "admin/comments";
    }
}
