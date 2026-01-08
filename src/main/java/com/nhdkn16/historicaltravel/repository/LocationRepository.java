package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

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

    long count();

    List<Location> findByNameContainingIgnoreCaseOrProvinceContainingIgnoreCase(String name, String province);

    Page<Location> findByStatus(Location.Status status, Pageable pageable);

    @Query("""
        SELECT l FROM Location l
        WHERE l.status = com.nhdkn16.historicaltravel.entity.Location.Status.ACTIVE
        AND (
            LOWER(l.name) LIKE LOWER(CONCAT('%', :keyword, '%'))
            OR LOWER(l.province) LIKE LOWER(CONCAT('%', :keyword, '%'))
        )
    """)
    Page<Location> searchActiveLocations(@Param("keyword") String keyword, Pageable pageable);
}
