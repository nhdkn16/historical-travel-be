package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhdkn16.historicaltravel.entity.Image;
import com.nhdkn16.historicaltravel.repository.ImageRepository;
import com.nhdkn16.historicaltravel.service.ImageService;

import jakarta.persistence.EntityNotFoundException;

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
            throw new EntityNotFoundException("Image not found: " + imageId);
        }
        imageRepository.deleteById(imageId);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Image> getImageById(Long imageId) {
        return imageRepository.findById(imageId);
    }

    @Override
    public Image save(Image image) {
        return imageRepository.save(image);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Image> getImagesForTarget(String targetType, Long targetId) {
        return imageRepository.findByTargetTypeAndTargetIdOrderByImageOrderAsc(targetType, targetId);
    }
}
