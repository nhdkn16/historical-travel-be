package com.nhdkn16.historicaltravel.service;

import java.util.List;
import java.util.Optional;

import com.nhdkn16.historicaltravel.entity.Notification;

public interface NotificationService {

    Notification markAsRead(Long notificationId);

    List<Notification> getNotificationsForUser(Long userId);

    List<Notification> getUnreadNotificationsForUser(Long userId);

    Notification create(Notification notification);

    long unreadCount(Long userId);

    Optional<Notification> getById(Long id);
}
