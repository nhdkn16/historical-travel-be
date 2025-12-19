package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.TourSchedule;

public interface TourService {

    Tour createTour(Tour tour);

    Tour updateTour(Long tourId, Tour updatedTour);

    void deleteTour(Long tourId);

    Optional<Tour> getTourById(Long tourId);

    List<Tour> getAll();

    List<Tour> getToursByLocation(Long locationId);

    List<Tour> getActiveTours();
    
    List<TourSchedule> getSchedulesByTour(Tour tour);

    Page<Tour> getAllTours(Pageable pageable);

    List<Tour> searchTours(String keyword);

    Page<Tour> searchToursPaged(String keyword, Pageable pageable);
}
