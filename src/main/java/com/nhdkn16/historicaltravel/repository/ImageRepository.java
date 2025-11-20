package com.nhdkn16.historicaltravel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {
    public List<Image> findAllImagesByTargetTypeAndTargetId(String targetType, long targetId);
}
