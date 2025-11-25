<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết Tour - TravelVN</title>
    <link rel="stylesheet" href="/stylesheets/location/detail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<body>
    <!-- Header -->
    <header class="header">
        <div class="container">
            <div class="logo"><a href="/">🌍 TravelVN</a></div>
            <nav class="nav">
                <ul>
                    <li><a href="/">Trang chủ</a></li>
                    <li><a href="/social">Cộng đồng</a></li>
                    <li><a href="/service">Dịch vụ</a></li>
                    <li><a href="/contact">Liên hệ</a></li>
                    <li><a href="/login">Đăng nhập</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Section -->
    <div class="hero-section" id="heroSection">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <span class="tour-badge" id="tourBadge">HOT</span>
            <h1 id="tourTitle">Đang tải...</h1>
            <p id="tourSubtitle" class="subtitle"></p>
            <div class="hero-meta">
                <span><i class="fas fa-clock"></i> <span id="tourDuration">4 ngày 3 đêm</span></span>
                <span><i class="fas fa-map-marker-alt"></i> <span id="tourLocation">Việt Nam</span></span>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <a href="/" class="back-button">
            <i class="fas fa-arrow-left"></i> Quay lại trang chủ
        </a>

        <div class="main-content">
            <!-- Left Content -->
            <div class="content-left">
                <!-- Description -->
                <section class="section">
                    <h2 class="section-title"><i class="fas fa-info-circle"></i> Giới thiệu</h2>
                    <div class="description" id="tourDescription">
                        <p>Đang tải mô tả...</p>
                    </div>
                </section>

                <!-- Highlights -->
                <section class="section highlights">
                    <h2 class="section-title"><i class="fas fa-star"></i> Điểm nổi bật</h2>
                    <ul id="tourHighlights">
                        <!-- Sẽ được thêm bởi JavaScript -->
                    </ul>
                </section>

                <!-- Gallery -->
                <section class="section gallery">
                    <h2 class="section-title"><i class="fas fa-images"></i> Hình ảnh</h2>
                    <div class="gallery-grid" id="galleryGrid">
                        <!-- Sẽ được thêm bởi JavaScript -->
                    </div>
                </section>

                <!-- Itinerary -->
                <section class="section itinerary">
                    <h2 class="section-title"><i class="fas fa-calendar-alt"></i> Lịch trình chi tiết</h2>
                    <div id="itineraryContainer">
                        <!-- Sẽ được thêm bởi JavaScript -->
                    </div>
                </section>

                <!-- Booking CTA -->
                <section class="section booking-cta">
                    <div class="cta-content">
                        <h2>Sẵn sàng khám phá?</h2>
                        <p>Đặt tour ngay hôm nay để nhận ưu đãi tốt nhất!</p>
                        <button class="btn-book-large" id="btnBookLarge">
                            <i class="fas fa-ticket-alt"></i>
                            Đặt Tour Ngay
                        </button>
                    </div>
                </section>
            </div>

            <!-- Sidebar -->
            <aside class="sidebar">
                <div class="booking-card">
                    <div class="price-section">
                        <div class="price-label">Giá chỉ từ</div>
                        <div class="price" id="tourPrice">0đ</div>
                        <div class="price-note">/ người</div>
                    </div>

                    <div class="booking-info">
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-clock"></i> Thời gian</span>
                            <span class="info-value" id="sidebarDuration">4N3Đ</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-plane"></i> Phương tiện</span>
                            <span class="info-value">Máy bay + Xe</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-hotel"></i> Khách sạn</span>
                            <span class="info-value">4 sao</span>
                        </div>
                        <div class="info-item">
                            <span class="info-label"><i class="fas fa-check-circle"></i> Bao gồm</span>
                            <span class="info-value">Vé + KS + Ăn</span>
                        </div>
                    </div>

                    <button class="btn-book" id="btnBook">
                        <i class="fas fa-ticket-alt"></i>
                        Đặt Ngay
                    </button>

                    <div class="contact-info">
                        <h4>Cần hỗ trợ?</h4>
                        <div class="contact-item">
                            <i class="fas fa-phone"></i>
                            <span>0799-XXXX</span>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-envelope"></i>
                            <span>hoangch.24itb@vku.udn.vn</span>
                        </div>
                    </div>
                </div>
            </aside>
        </div>
    </div>

    <!-- Lightbox -->
    <div class="lightbox" id="lightbox" onclick="closeLightbox()">
        <span class="lightbox-close">&times;</span>
        <img class="lightbox-content" id="lightboxImg">
    </div>

    <script src="/scripts/location/detail.js"></script>
</body>
</html>