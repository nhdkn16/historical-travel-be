package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Image;

import java.util.List;

public interface ImageRepository extends JpaRepository<Image, Long> {
    
    List<Image> findByTargetTypeAndTargetIdOrderByImageOrderAsc(String targetType, Long targetId);

    List<Image> findByTargetTypeAndTargetId(String targetType, Long targetId);

    List<Image> findByTargetTypeAndTargetId(Image.TargetType targetType, Long targetId);
}
