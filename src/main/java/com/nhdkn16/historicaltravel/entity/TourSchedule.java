package com.nhdkn16.historicaltravel.entity;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.nhdkn16.historicaltravel.enums.ScheduleStatus;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "tour_schedule")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TourSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "schedule_id")
    private Long scheduleId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    @Column(name = "start_date", nullable = false)
    private LocalDate startDate;

    @Column(name = "available_slots")
    private Integer availableSlots;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ScheduleStatus status = ScheduleStatus.AVAILABLE;

    // Relationships
    @OneToMany(mappedBy = "tourSchedule", cascade = CascadeType.ALL)
    private List<Booking> bookings = new ArrayList<>();
}
