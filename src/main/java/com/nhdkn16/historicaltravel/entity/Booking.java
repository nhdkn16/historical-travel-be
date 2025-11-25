package com.nhdkn16.historicaltravel.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "bookings")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bookingId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_schedule_id", nullable = false)
    private TourSchedule tourSchedule;

    @Column(nullable = false)
    private Integer participantCount;

    @Column(nullable = false, precision = 10, scale = 2)
    private BigDecimal totalPrice;

    @Column(nullable = false, length = 255)
    private String customerName;

    @Column(length = 100)
    private String customerEmail;

    @Column(length = 20)
    private String customerPhone;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Status status = Status.PENDING;

    private LocalDateTime bookingDate;

    @Column(columnDefinition = "TEXT")
    private String notes;

    @PrePersist
    public void onCreate() {
        if (bookingDate == null) {
            bookingDate = LocalDateTime.now();
        }
    }

    public enum Status {
        PENDING,
        CONFIRMED,
        CANCELLED
    }
}
