package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.dto.request.AdminDashboardStatsRequest;
import com.nhdkn16.historicaltravel.repository.BookingRepository;
import com.nhdkn16.historicaltravel.repository.CommentRepository;
import com.nhdkn16.historicaltravel.repository.LocationRepository;
import com.nhdkn16.historicaltravel.repository.PostRepository;
import com.nhdkn16.historicaltravel.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminDashboardService {
    private final UserRepository userRepo;
    private final LocationRepository locationRepo;
    private final PostRepository postRepo;
    private final CommentRepository commentRepo;
    private final BookingRepository bookingRepo;

    public AdminDashboardStatsRequest getDashboardStats() {

        long users = userRepo.count();
        long locations = locationRepo.count();
        long posts = postRepo.count();
        long comments = commentRepo.count();
        long bookings = bookingRepo.count();

        List<AdminDashboardStatsRequest.StatItem> table = List.of(
            new AdminDashboardStatsRequest.StatItem("Người dùng", users),
            new AdminDashboardStatsRequest.StatItem("Địa điểm", locations),
            new AdminDashboardStatsRequest.StatItem("Bài viết", posts),
            new AdminDashboardStatsRequest.StatItem("Bình luận", comments),
            new AdminDashboardStatsRequest.StatItem("Booking", bookings)
        );

        return new AdminDashboardStatsRequest(
            users, locations, posts, comments, bookings,
            table,
            List.of("Users", "Locations", "Posts", "Comments", "Bookings"),
            List.of(users, locations, posts, comments, bookings)
        );
    }
}
