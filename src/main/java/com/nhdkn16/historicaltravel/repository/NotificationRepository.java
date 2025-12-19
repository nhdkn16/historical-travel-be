package com.nhdkn16.historicaltravel.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nhdkn16.historicaltravel.entity.Notification;
import com.nhdkn16.historicaltravel.entity.User;

import java.util.List;

public interface NotificationRepository extends JpaRepository<Notification, Long> {

    List<Notification> findByUserOrderByCreatedAtDesc(User user);

    List<Notification> findByUserAndIsReadFalseOrderByCreatedAtDesc(User user);

    List<Notification> findByUser_UserIdOrderByCreatedAtDesc(Long userId);

    long countByUser_UserIdAndIsReadFalse(Long userId);
}
