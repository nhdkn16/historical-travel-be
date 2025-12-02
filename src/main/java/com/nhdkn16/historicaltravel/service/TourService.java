package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.TourSchedule;

public interface TourService {

    Tour createTour(Tour tour);

    Tour updateTour(Long tourId, Tour updatedTour);

    void deleteTour(Long tourId);

    Optional<Tour> getTourById(Long tourId);

    List<Tour> getAllTours();

    List<Tour> getToursByLocation(Long locationId);

    List<Tour> getActiveTours();
    
    List<TourSchedule> getSchedulesByTour(Tour tour);
}
