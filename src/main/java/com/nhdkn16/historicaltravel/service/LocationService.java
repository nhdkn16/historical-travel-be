package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;

import com.nhdkn16.historicaltravel.entity.Location;

public interface LocationService {

    Location createLocation(Location location);

    Location updateLocation(Long id, Location location);

    void deleteLocation(Long id);

    Optional<Location> getLocationById(Long id);

    List<Location> getAllLocations();

    List<Location> searchByName(String keyword);

    List<Location> getByProvince(String province);

    List<Location> getByType(Location.LocationType type);

    List<Location> getByStatus(Location.Status status);

    List<Location> getLatestLocations();

    List<Location> search(String keyword);

    List<Location> getRandomLocations(int limit);

    List<Location> getAllActiveLocations();

    Page<Location> getActiveLocations(int page, int size);

    Page<Location> searchLocations(String keyword, int page, int size);
}
