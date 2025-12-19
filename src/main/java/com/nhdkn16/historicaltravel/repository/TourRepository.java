package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.nhdkn16.historicaltravel.entity.Location;
import com.nhdkn16.historicaltravel.entity.Tour;
import com.nhdkn16.historicaltravel.entity.Tour.Status;

import java.util.List;

public interface TourRepository extends JpaRepository<Tour, Long> {

    List<Tour> findByLocation(Location location);

    List<Tour> findByStatus(Status status);

    List<Tour> findByLocationAndStatus(Location location, Status status);

    @Query("SELECT t FROM Tour t WHERE " +
           "LOWER(t.name) LIKE LOWER(CONCAT('%', :kw, '%')) OR " +
           "LOWER(t.location.name) LIKE LOWER(CONCAT('%', :kw, '%'))")
    List<Tour> searchTours(@Param("kw") String keyword);

    Page<Tour> findByNameContainingIgnoreCase(String keyword, Pageable pageable);
}
