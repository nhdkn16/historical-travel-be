package com.nhdkn16.historicaltravel.dto.request;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminDashboardStatsRequest {
    private long totalUsers;
    private long totalLocations;
    private long totalPosts;
    private long totalComments;
    private long totalBookings;

    private List<StatItem> tableStats;

    private List<String> chartLabels;
    private List<Long> chartValues;

    @Data
    @AllArgsConstructor
    public static class StatItem {
        private String name;
        private long value;
    }
}
