package com.nhdkn16.historicaltravel.controller;

import java.security.Principal;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nhdkn16.historicaltravel.dto.request.BookingRequest;
import com.nhdkn16.historicaltravel.dto.request.TourRequest;
import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.TourSchedule;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.service.BookingService;
import com.nhdkn16.historicaltravel.service.TourScheduleService;
import com.nhdkn16.historicaltravel.service.TourService;
import com.nhdkn16.historicaltravel.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/service")
public class TourController {

    private final TourService tourService;
    private final BookingService bookingService;
    private final TourScheduleService tourScheduleService;
    private final UserService userService;

    @GetMapping
    public String servicePage(@RequestParam(defaultValue = "") String keyword, @RequestParam(defaultValue = "0") int page, Model model, Principal principal) {
        Pageable pageable = PageRequest.of(page, 8);

        Page<Tour> tourPage;

        if (keyword == null || keyword.trim().isEmpty()) {
            tourPage = tourService.getAllTours(pageable);
        } else {
            tourPage = tourService.searchToursPaged(keyword, pageable);
            model.addAttribute("keyword", keyword);
        }

        Optional<User> optionalUser = userService.getLoggedInUser();
        User loggedInUser = optionalUser.orElse(null);
        model.addAttribute("loggedInUser", loggedInUser);

        if (principal != null) {
            Optional<User> optUser = userService.findByUsername(principal.getName());
            model.addAttribute("user", optUser.orElse(null));
        } else {
            model.addAttribute("user", null);
        }

        List<TourRequest> tourCards = tourPage.getContent().stream()
                .map(t -> {
                    Long defaultSchedule = tourScheduleService
                            .getDefaultSchedule(t.getTourId())
                            .map(TourSchedule::getScheduleId)
                            .orElse(null);

                    return TourRequest.builder()
                            .tourId(t.getTourId())
                            .name(t.getName())
                            .locationName(t.getLocation().getName())
                            .pricePerPerson(t.getPricePerPerson())
                            .defaultScheduleId(defaultSchedule)
                            .build();
                }).toList();

        model.addAttribute("tours", tourCards);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", tourPage.getTotalPages());

        model.addAttribute("bookingRequest", new BookingRequest());

        return "user/location/service";
    }

    @PostMapping("/booking")
    public String bookTour(@ModelAttribute("bookingRequest") BookingRequest req, RedirectAttributes redirect) {

        bookingService.createBooking(req);

        redirect.addFlashAttribute("success", "Đặt vé thành công!");

        return "redirect:/service";
    }
}

