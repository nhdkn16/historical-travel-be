package com.nhdkn16.historicaltravel.service.impl;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nhdkn16.historicaltravel.entity.Notification;
import com.nhdkn16.historicaltravel.entity.User;
import com.nhdkn16.historicaltravel.repository.NotificationRepository;
import com.nhdkn16.historicaltravel.repository.UserRepository;
import com.nhdkn16.historicaltravel.service.NotificationService;

import jakarta.persistence.EntityNotFoundException;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {

    private final NotificationRepository notificationRepository;
    private final UserRepository userRepository;

    @Override
    public Notification markAsRead(Long id) {
        Notification n = notificationRepository.findById(id)
                .orElseThrow(() -> new EntityNotFoundException("Notification not found: " + id));
        n.setIsRead(true);
        return notificationRepository.save(n);
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

    @Override
    public Notification create(Notification notification) {
        notification.setCreatedAt(LocalDateTime.now());
        return notificationRepository.save(notification);
    }

    @Override
    @Transactional(readOnly = true)
    public long unreadCount(Long userId) {
        return notificationRepository.countByUser_UserIdAndIsReadFalse(userId);
    }

    @Override
    @Transactional(readOnly = true)
    public Optional<Notification> getById(Long id) {
        return notificationRepository.findById(id);
    }
}
