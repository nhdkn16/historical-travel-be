package com.nhdkn16.historicaltravel.dto.request;

import lombok.Data;

@Data
public class BookingRequest {
    private Long tourId;
    private Long scheduleId;
    private Long userId;
    private Integer participantCount;
    private String customerName;
    private String customerPhone;
    private String customerEmail;
    private String notes;
    private String paymentMethod;
}