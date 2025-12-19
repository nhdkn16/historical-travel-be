package com.nhdkn16.historicaltravel.dto.request;

import java.math.BigDecimal;

import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class TourRequest {
    private Long tourId;
    private String name;
    private String locationName;
    private BigDecimal pricePerPerson;
    private Long defaultScheduleId;
}

