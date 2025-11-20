package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Image;
import com.nhdkn16.historicaltravel.repository.ImageRepository;

@Service
public class ImageService {
    private final ImageRepository imageRepository;

    public ImageService(ImageRepository imageRepository) {
        this.imageRepository = imageRepository;
    }

    public Image handleAddImage(Image image) {
        return this.imageRepository.save(image);
    }

    public List<Image> handleGetAllImage(String targetType, long targetId) {
        return this.imageRepository.findAllImagesByTargetTypeAndTargetId(targetType, targetId);
    }

    public void handleDeleteImageById(long id) {
        this.imageRepository.deleteById(id);
    }
}
