package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.repository.LocationRepository;

@Service
public class LocationService {
    private final LocationRepository locationRepository;

    public LocationService(LocationRepository locationRepository) {
        this.locationRepository = locationRepository;
    }

    public Location handleAddLocation(Location location) {
        return this.locationRepository.save(location);
    }

    public Optional<Location> handleGetLocationById(long id) {
        return this.locationRepository.findById(id);
    }

    public List<Location> handleGetAllLocations() {
        return this.locationRepository.findAll();
    }
 
    public void handleDeleteLocationById(long id) {
        this.locationRepository.deleteById(id);
    }
}
