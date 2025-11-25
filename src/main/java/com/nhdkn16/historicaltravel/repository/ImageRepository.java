package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Image;
import com.nhdkn16.historicaltravel.entity.Image.TargetType;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Long> {

    List<Image> findByTargetTypeAndTargetIdOrderByImageOrderAsc(TargetType targetType, Long targetId);

    List<Image> findByTargetType(TargetType targetType);
}
