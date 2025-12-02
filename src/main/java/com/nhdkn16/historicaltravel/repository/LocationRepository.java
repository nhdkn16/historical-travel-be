package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Location.LocationType;
import com.nhdkn16.historicaltravel.entity.Location.Status;

import java.util.List;

public interface LocationRepository extends JpaRepository<Location, Long> {

    List<Location> findByProvince(String province);

    List<Location> findByType(LocationType type);

    List<Location> findByStatus(Status status);

    List<Location> findByNameContainingIgnoreCase(String keyword);

    List<Location> findTop7ByStatusOrderByCreatedAtDesc(Location.Status status);
}
