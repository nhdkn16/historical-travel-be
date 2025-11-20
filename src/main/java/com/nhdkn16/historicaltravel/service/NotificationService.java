package com.nhdkn16.historicaltravel.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Notification;
import com.nhdkn16.historicaltravel.repository.NotificationRepository;

@Service
public class NotificationService {
    private final NotificationRepository notificationRepository;

    public NotificationService(NotificationRepository notificationRepository) {
        this.notificationRepository = notificationRepository;
    }

    public Notification handleAddNotification(Notification notification) {
        return this.notificationRepository.save(notification);
    }

    public List<Notification> handleGetAllNotificationsByUserId(long id) {
        return this.notificationRepository.findAllNotificationsByUserId(id);
    }

    public void handleDeleteNotificationById(long id) {
        this.notificationRepository.deleteById(id);
    }
}
