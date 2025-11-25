package com.nhdkn16.historicaltravel.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;

@Entity
@Table(name = "tour_schedules")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TourSchedule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long scheduleId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_id", nullable = false)
    private Tour tour;

    @Column(nullable = false)
    private LocalDate startDate;

    private Integer availableSlots;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status = Status.AVAILABLE;

    public enum Status {
        AVAILABLE,
        FULL
    }
}
