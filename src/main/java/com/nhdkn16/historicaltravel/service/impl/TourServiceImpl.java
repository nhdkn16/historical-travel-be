package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.TourSchedule;
import com.nhdkn16.historicaltravel.repository.LocationRepository;
import com.nhdkn16.historicaltravel.repository.TourRepository;
import com.nhdkn16.historicaltravel.repository.TourScheduleRepository;
import com.nhdkn16.historicaltravel.service.TourService;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class TourServiceImpl implements TourService {

    private final TourRepository tourRepository;
    private final TourScheduleRepository scheduleRepository;
    private final LocationRepository locationRepository;

    @Override
    public Tour createTour(Tour tour) {
        return tourRepository.save(tour);
    }

    @Override
    public Tour updateTour(Long tourId, Tour updatedTour) {
        return tourRepository.findById(tourId)
                .map(tour -> {
                    tour.setName(updatedTour.getName());
                    tour.setDescription(updatedTour.getDescription());
                    tour.setPricePerPerson(updatedTour.getPricePerPerson());
                    tour.setMaxParticipants(updatedTour.getMaxParticipants());
                    tour.setStatus(updatedTour.getStatus());
                    tour.setLocation(updatedTour.getLocation());
                    return tourRepository.save(tour);
                })
                .orElseThrow(() -> new RuntimeException("Tour not found"));
    }

    @Override
    public void deleteTour(Long tourId) {
        if (!tourRepository.existsById(tourId)) {
            throw new RuntimeException("Tour not found");
        }
        tourRepository.deleteById(tourId);
    }

    @Override
    public Optional<Tour> getTourById(Long tourId) {
        return tourRepository.findById(tourId);
    }

    @Override
    public List<Tour> getAll() {
        return tourRepository.findAll();
    }

    @Override
    public List<Tour> getToursByLocation(Long locationId) {
        Location location = locationRepository.findById(locationId)
                .orElseThrow(() -> new RuntimeException("Location not found"));
        return tourRepository.findByLocation(location);
    }

    @Override
    public List<Tour> getActiveTours() {
        return tourRepository.findByStatus(Tour.Status.ACTIVE);
    }

    @Override
    public List<TourSchedule> getSchedulesByTour(Tour tour) {
        return scheduleRepository.findByTourOrderByStartDateAsc(tour);
    }

    @Override
    public Page<Tour> getAllTours(Pageable pageable) {
        return tourRepository.findAll(pageable);
    }

    @Override
    public List<Tour> searchTours(String keyword) {
        return tourRepository.searchTours(keyword);
    }

    @Override
    public Page<Tour> searchToursPaged(String keyword, Pageable pageable) {
        return tourRepository.findByNameContainingIgnoreCase(keyword, pageable);
    }
}