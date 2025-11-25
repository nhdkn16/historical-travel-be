package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Image;
import com.nhdkn16.historicaltravel.entity.Image.TargetType;

public interface ImageService {

    Image uploadImage(Image image);

    void deleteImage(Long imageId);

    Optional<Image> getImageById(Long imageId);

    List<Image> getImagesByTarget(TargetType targetType, Long targetId);
}
