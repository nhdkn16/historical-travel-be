package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.TourSchedule;
import com.nhdkn16.historicaltravel.entity.TourSchedule.Status;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

public interface TourScheduleRepository extends JpaRepository<TourSchedule, Long> {

    List<TourSchedule> findByTour(Tour tour);

    List<TourSchedule> findByStatus(Status status);

    List<TourSchedule> findByTourAndStatus(Tour tour, Status status);

    List<TourSchedule> findByStartDateAfter(LocalDate date);

    List<TourSchedule> findByTourOrderByStartDateAsc(Tour tour);

    Optional<TourSchedule> findTopByTourAndStatusOrderByStartDateAsc(Tour tour, Status status);
}
