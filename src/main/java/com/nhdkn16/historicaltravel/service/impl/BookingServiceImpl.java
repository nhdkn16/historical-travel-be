package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.dto.request.BookingRequest;
import com.nhdkn16.historicaltravel.entity.Booking;
import com.nhdkn16.historicaltravel.entity.TourSchedule;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.repository.BookingRepository;
import com.nhdkn16.historicaltravel.repository.TourScheduleRepository;
import com.nhdkn16.historicaltravel.repository.UserRepository;
import com.nhdkn16.historicaltravel.service.BookingService;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BookingServiceImpl implements BookingService {

    private final BookingRepository bookingRepository;
    private final UserRepository userRepository;
    private final TourScheduleRepository scheduleRepository;    

    @Override
    public Booking createBooking(Booking booking) {
        User user = userRepository.findById(booking.getUser().getUserId())
                .orElseThrow(() -> new RuntimeException("User not found"));
        TourSchedule schedule = scheduleRepository.findById(booking.getTourSchedule().getScheduleId())
                .orElseThrow(() -> new RuntimeException("Tour schedule not found"));

        if (schedule.getAvailableSlots() != null && booking.getParticipantCount() > schedule.getAvailableSlots()) {
            throw new RuntimeException("Not enough available slots");
        }

        if (schedule.getAvailableSlots() != null) {
            int remaining = schedule.getAvailableSlots() - booking.getParticipantCount();
            schedule.setAvailableSlots(remaining);
            schedule.setStatus(remaining <= 0 ? TourSchedule.Status.FULL : TourSchedule.Status.AVAILABLE);
            scheduleRepository.save(schedule);
        }

        booking.setUser(user);
        booking.setTourSchedule(schedule);

        return bookingRepository.save(booking);
    }

    @Override
    public void createBooking(BookingRequest req) {
        Booking booking = new Booking();

        booking.setCustomerName(req.getCustomerName());
        booking.setCustomerPhone(req.getCustomerPhone());
        booking.setCustomerEmail(req.getCustomerEmail());
        booking.setNotes(req.getNotes());
        booking.setParticipantCount(req.getParticipantCount());

        TourSchedule schedule = scheduleRepository.findById(req.getScheduleId())
                .orElseThrow(() -> new RuntimeException("Schedule not found"));

        booking.setTourSchedule(schedule);

        if (req.getUserId() != null) {
            User user = userRepository.findById(req.getUserId())
                    .orElseThrow(() -> new RuntimeException("User not found"));
            booking.setUser(user);
        } else {
            booking.setUser(null);
        }

        BigDecimal pricePerPerson = schedule.getTour().getPricePerPerson();
        BigDecimal total = pricePerPerson.multiply(BigDecimal.valueOf(req.getParticipantCount()));
        booking.setTotalPrice(total);

        bookingRepository.save(booking);

        int remain = schedule.getAvailableSlots() - req.getParticipantCount();
        schedule.setAvailableSlots(Math.max(remain, 0));
        scheduleRepository.save(schedule);
    }


    @Override
    public Booking updateBooking(Long bookingId, Booking updatedBooking) {
        return bookingRepository.findById(bookingId)
                .map(booking -> {
                    booking.setParticipantCount(updatedBooking.getParticipantCount());
                    booking.setTotalPrice(updatedBooking.getTotalPrice());
                    booking.setCustomerName(updatedBooking.getCustomerName());
                    booking.setCustomerEmail(updatedBooking.getCustomerEmail());
                    booking.setCustomerPhone(updatedBooking.getCustomerPhone());
                    booking.setStatus(updatedBooking.getStatus());
                    booking.setNotes(updatedBooking.getNotes());
                    return bookingRepository.save(booking);
                })
                .orElseThrow(() -> new RuntimeException("Booking not found"));
    }

    @Override
    public void cancelBooking(Long bookingId) {
        Booking booking = bookingRepository.findById(bookingId)
                .orElseThrow(() -> new RuntimeException("Booking not found"));

        booking.setStatus(Booking.Status.CANCELLED);

        TourSchedule schedule = booking.getTourSchedule();
        if (schedule.getAvailableSlots() != null) {
            int newSlots = schedule.getAvailableSlots() + booking.getParticipantCount();
            schedule.setAvailableSlots(newSlots);
            schedule.setStatus(TourSchedule.Status.AVAILABLE);
            scheduleRepository.save(schedule);
        }

        bookingRepository.save(booking);
    }

    @Override
    public Optional<Booking> getBookingById(Long bookingId) {
        return bookingRepository.findById(bookingId);
    }

    @Override
    public List<Booking> getBookingsByUser(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return bookingRepository.findByUser(user);
    }

    @Override
    public List<Booking> getBookingsByTourSchedule(Long scheduleId) {
        TourSchedule schedule = scheduleRepository.findById(scheduleId)
                .orElseThrow(() -> new RuntimeException("Tour schedule not found"));
        return bookingRepository.findByTourSchedule(schedule);
    }

    @Override
    public List<Booking> getBookingsByStatus(Booking.Status status) {
        return bookingRepository.findByStatus(status);
    }
}
