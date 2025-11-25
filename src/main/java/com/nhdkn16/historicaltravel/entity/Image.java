package com.nhdkn16.historicaltravel.entity;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "images")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long imageId;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private TargetType targetType;

    @Column(nullable = false)
    private Long targetId;

    @Column(nullable = false, length = 500)
    private String imageUrl;

    @Column(columnDefinition = "INT DEFAULT 0")
    private Integer imageOrder = 0;

    @Column(length = 255)
    private String altText;

    private LocalDateTime uploadedAt;

    @PrePersist
    public void onUpload() {
        uploadedAt = LocalDateTime.now();
    }

    public enum TargetType {
        LOCATION,
        POST,
        USER_AVATAR
    }
}
