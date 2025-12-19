package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Image;

public interface ImageService {

    Image uploadImage(Image image);

    void deleteImage(Long imageId);

    Optional<Image> getImageById(Long imageId);

    Image save(Image image);

    List<Image> getImagesForTarget(String targetType, Long targetId);
}
