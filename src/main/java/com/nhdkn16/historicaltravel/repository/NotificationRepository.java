package com.nhdkn16.historicaltravel.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Notification;

public interface NotificationRepository extends JpaRepository<Notification, Long> {
    List<Notification> findAllNotificationsByUserId(long userId);
}
