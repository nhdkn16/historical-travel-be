package com.nhdkn16.historicaltravel.service.impl;

import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.repository.LocationRepository;
import com.nhdkn16.historicaltravel.service.LocationService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LocationServiceImpl implements LocationService {

    private final LocationRepository locationRepository;

    @Override
    public Location createLocation(Location location) {
        return locationRepository.save(location);
    }

    @Override
    public Location updateLocation(Long id, Location updated) {
        return locationRepository.findById(id)
                .map(location -> {
                    location.setName(updated.getName());
                    location.setDescription(updated.getDescription());
                    location.setAddress(updated.getAddress());
                    location.setProvince(updated.getProvince());
                    location.setType(updated.getType());
                    location.setHistoricalPeriod(updated.getHistoricalPeriod());
                    location.setLatitude(updated.getLatitude());
                    location.setLongitude(updated.getLongitude());
                    location.setMainImageUrl(updated.getMainImageUrl());
                    location.setStatus(updated.getStatus());
                    return locationRepository.save(location);
                })
                .orElseThrow(() -> new RuntimeException("Location not found"));
    }

    @Override
    public void deleteLocation(Long id) {
        if (!locationRepository.existsById(id)) {
            throw new RuntimeException("Location not found");
        }
        locationRepository.deleteById(id);
    }

    @Override
    public Optional<Location> getLocationById(Long id) {
        return locationRepository.findById(id);
    }

    @Override
    public List<Location> getAllLocations() {
        return locationRepository.findAll();
    }

    @Override
    public List<Location> searchByName(String keyword) {
        return locationRepository.findByNameContainingIgnoreCase(keyword);
    }

    @Override
    public List<Location> getByProvince(String province) {
        return locationRepository.findByProvince(province);
    }

    @Override
    public List<Location> getByType(Location.LocationType type) {
        return locationRepository.findByType(type);
    }

    @Override
    public List<Location> getByStatus(Location.Status status) {
        return locationRepository.findByStatus(status);
    }

    @Override
    public List<Location> getLatestLocations() {
        return locationRepository.findTop7ByStatusOrderByCreatedAtDesc(Location.Status.ACTIVE);
    }

    @Override
    public List<Location> search(String keyword) {
        return locationRepository.findByNameContainingIgnoreCaseOrProvinceContainingIgnoreCase(keyword, keyword);
    }

    @Override
    public List<Location> getRandomLocations(int limit) {
        List<Location> allLocations = locationRepository.findAll();
        Collections.shuffle(allLocations);

        return allLocations.stream()
                .limit(limit)
                .toList();
    }

    @Override
    public List<Location> getAllActiveLocations() {
        return locationRepository.findByStatus(Location.Status.ACTIVE);
    }

    @Override
    public Page<Location> getActiveLocations(int page, int size) {
        Pageable pageable = PageRequest.of(page, size, Sort.by("createdAt").descending());
        return locationRepository.findByStatus(Location.Status.ACTIVE, pageable);
    }

    @Override
    public Page<Location> searchLocations(String keyword, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        return locationRepository.searchActiveLocations(keyword, pageable);
    }
}
