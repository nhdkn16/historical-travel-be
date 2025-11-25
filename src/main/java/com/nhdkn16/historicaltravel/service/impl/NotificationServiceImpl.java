package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import com.nhdkn16.historicaltravel.entity.Notification;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.repository.NotificationRepository;
import com.nhdkn16.historicaltravel.repository.UserRepository;
import com.nhdkn16.historicaltravel.service.NotificationService;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final NotificationRepository notificationRepository;
    private final UserRepository userRepository;

    @Override
    public Notification createNotification(Notification notification) {

        if (notification.getUser() == null) {
            throw new RuntimeException("Recipient user must be provided");
        }

        return notificationRepository.save(notification);
    }

    @Override
    public void markAsRead(Long notificationId) {
        Notification notification = notificationRepository.findById(notificationId)
                .orElseThrow(() -> new RuntimeException("Notification not found"));

        notification.setIsRead(true);
        notificationRepository.save(notification);
    }

    @Override
    public Optional<Notification> getNotificationById(Long notificationId) {
        return notificationRepository.findById(notificationId);
    }

    @Override
    public List<Notification> getNotificationsForUser(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return notificationRepository.findByUserOrderByCreatedAtDesc(user);
    }

    @Override
    public List<Notification> getUnreadNotificationsForUser(Long userId) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        return notificationRepository.findByUserAndIsReadFalseOrderByCreatedAtDesc(user);
    }
}
