package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Image;
import com.nhdkn16.historicaltravel.entity.Image.TargetType;
import com.nhdkn16.historicaltravel.repository.ImageRepository;
import com.nhdkn16.historicaltravel.service.ImageService;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ImageServiceImpl implements ImageService {

    private final ImageRepository imageRepository;

    @Override
    public Image uploadImage(Image image) {
        return imageRepository.save(image);
    }

    @Override
    public void deleteImage(Long imageId) {
        if (!imageRepository.existsById(imageId)) {
            throw new RuntimeException("Image not found");
        }
        imageRepository.deleteById(imageId);
    }

    @Override
    public Optional<Image> getImageById(Long imageId) {
        return imageRepository.findById(imageId);
    }

    @Override
    public List<Image> getImagesByTarget(TargetType targetType, Long targetId) {
        return imageRepository.findByTargetTypeAndTargetIdOrderByImageOrderAsc(targetType, targetId);
    }
}
