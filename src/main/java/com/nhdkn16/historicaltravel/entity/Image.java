package com.nhdkn16.historicaltravel.entity;

import java.time.LocalDateTime;

import org.hibernate.annotations.CreationTimestamp;

import com.nhdkn16.historicaltravel.enums.ImageTargetType;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "images")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Image {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long imageId;

    @Enumerated(EnumType.STRING)
    @Column(name = "target_type", nullable = false)
    private ImageTargetType targetType;

    @Column(name = "target_id", nullable = false)
    private Long targetId;

    @Column(name = "image_url", nullable = false, length = 500)
    private String imageUrl;

    @Column(name = "image_order")
    private Integer order = 0;

    @Column(name = "alt_text", length = 255)
    private String altText;

    @CreationTimestamp
    @Column(name = "uploaded_at", updatable = false)
    private LocalDateTime uploadedAt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_id", insertable = false, updatable = false)
    private Location location;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_id", insertable = false, updatable = false)
    private Post post;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_id", insertable = false, updatable = false)
    private User user;
}
