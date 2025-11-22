package com.nhdkn16.historicaltravel.entity;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import com.nhdkn16.historicaltravel.enums.BookingStatus;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "bookings")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "booking_id")
    private Long bookingId;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "tour_schedule_id", nullable = false)
    private TourSchedule tourSchedule;

    @Column(name = "participant_count", nullable = false)
    private Integer participantCount;

    @Column(name = "total_price", nullable = false, precision = 10, scale = 2)
    private BigDecimal totalPrice;

    @Column(name = "customer_name", nullable = false, length = 255)
    private String customerName;

    @Column(name = "customer_email", length = 100)
    private String customerEmail;

    @Column(name = "customer_phone", length = 20)
    private String customerPhone;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private BookingStatus status = BookingStatus.PENDING;

    @CreationTimestamp
    @Column(name = "booking_date", updatable = false)
    private LocalDateTime bookingDate;

    @Column(columnDefinition = "TEXT")
    private String notes;

    // Transient field để nhận dữ liệu từ client
    @Transient
    private Long tourScheduleId;

    // Auto calculate total price before persisting
    @PrePersist
    @PreUpdate
    public void calculateTotalPrice() {
        if (this.tourSchedule != null && 
            this.tourSchedule.getTour() != null && 
            this.participantCount != null) {
            
            BigDecimal pricePerPerson = this.tourSchedule.getTour().getPricePerPerson();
            this.totalPrice = pricePerPerson.multiply(BigDecimal.valueOf(this.participantCount));
        }
    }
}
