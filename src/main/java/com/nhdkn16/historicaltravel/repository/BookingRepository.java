package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Booking;
import com.nhdkn16.historicaltravel.entity.TourSchedule;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;

public interface BookingRepository extends JpaRepository<Booking, Long> {

    List<Booking> findByUser(User user);

    List<Booking> findByTourSchedule(TourSchedule tourSchedule);

    List<Booking> findByStatus(Booking.Status status);
}
