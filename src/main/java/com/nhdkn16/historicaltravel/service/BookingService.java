package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.dto.request.BookingRequest;
import com.nhdkn16.historicaltravel.entity.Booking;

public interface BookingService {
    void createBooking(BookingRequest req);

    Booking createBooking(Booking booking);

    Booking updateBooking(Long bookingId, Booking updatedBooking);

    void cancelBooking(Long bookingId);

    Optional<Booking> getBookingById(Long bookingId);

    List<Booking> getBookingsByUser(Long userId);

    List<Booking> getBookingsByTourSchedule(Long scheduleId);

    List<Booking> getBookingsByStatus(Booking.Status status);
}

