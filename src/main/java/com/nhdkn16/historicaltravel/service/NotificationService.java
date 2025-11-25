package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Notification;

public interface NotificationService {

    Notification createNotification(Notification notification);

    void markAsRead(Long notificationId);

    Optional<Notification> getNotificationById(Long notificationId);

    List<Notification> getNotificationsForUser(Long userId);

    List<Notification> getUnreadNotificationsForUser(Long userId);
}
