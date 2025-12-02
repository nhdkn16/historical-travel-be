<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${location.name} - TravelVN</title>
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
    <div class="hero-section" style="background-image: url(${location.mainImageUrl});">
        <div class="hero-overlay"></div>
        <div class="hero-content">
            <h1>${location.name}</h1>
            <p class="subtitle">${location.province}</p>
            <div class="hero-meta">
                <span><i class="fas fa-map-marker-alt"></i> ${location.address}</span>
                <span><i class="fas fa-tag"></i> Loại: ${location.type}</span>
            </div>
        </div>
    </div>

    <!-- Main Content -->
    <div class="container">
        <a href="/" class="back-button"><i class="fas fa-arrow-left"></i> Quay lại trang chủ</a>

        <div class="main-content">
            <!-- Left Content -->
            <div class="content-left">
                <!-- Location Description -->
                <section class="section">
                    <h2 class="section-title"><i class="fas fa-info-circle"></i> Giới thiệu</h2>
                    <div class="description">
                        <p>${location.description}</p>
                    </div>
                </section>

                <!-- Tours List -->
                <section class="section location-tours">
                    <h2 class="section-title"><i class="fas fa-route"></i> Tour tại ${location.name}</h2>
                    <c:if test="${not empty tours}">
                        <ul class="tour-list">
                            <c:forEach var="t" items="${tours}">
                                <li>
                                    <!-- href="/service/detail/${t.tourId}" -->
                                    <a>${t.name}</a>
                                    - Giá: ${t.pricePerPerson}đ
                                    - Số lượng tối đa: ${t.maxParticipants} người
                                    - Trạng thái: ${t.status}
                                </li>
                            </c:forEach>
                        </ul>
                    </c:if>
                    <c:if test="${empty tours}">
                        <p>Hiện chưa có tour nào cho địa điểm này.</p>
                    </c:if>
                </section>

                <!-- Booking CTA -->
                <section class="section booking-cta">
                    <div class="cta-content">
                        <h2>Sẵn sàng khám phá?</h2>
                        <p>Chọn tour và đặt ngay hôm nay để nhận ưu đãi tốt nhất!</p>
                        <button class="btn-book-large">
                            <i class="fas fa-ticket-alt"></i> Đặt Tour Ngay
                        </button>
                    </div>
                </section>
            </div>

            <!-- Sidebar -->
            <aside class="sidebar">
                <c:choose>
                    <c:when test="${not empty tours}">
                        <c:set var="firstTour" value="${tours[0]}" />
                        <div class="booking-card">
                            <div class="price-section">
                                <div class="price-label">Giá mỗi người</div>
                                <div class="price">${firstTour.pricePerPerson}đ</div>
                                <div class="price-note">/ người</div>
                            </div>

                            <div class="booking-info">
                                <div class="info-item">
                                    <span class="info-label"><i class="fas fa-users"></i> Số lượng tối đa</span>
                                    <span class="info-value">${firstTour.maxParticipants}</span>
                                </div>
                                <div class="info-item">
                                    <span class="info-label"><i class="fas fa-check-circle"></i> Trạng thái</span>
                                    <span class="info-value">${firstTour.status}</span>
                                </div>
                            </div>

                            <button class="btn-book">
                                <i class="fas fa-ticket-alt"></i> Đặt Ngay
                            </button>

                            <div class="contact-info">
                                <h4>Cần hỗ trợ?</h4>
                                <div class="contact-item"><i class="fas fa-phone"></i> 0799-XXXX</div>
                                <div class="contact-item"><i class="fas fa-envelope"></i> hoangch.24itb@vku.udn.vn</div>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <!-- Nếu không có tour nào -->
                        <div class="booking-card">
                            <p>Chưa có tour nào để đặt.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
            </aside>
        </div>
    </div>

    <script src="/scripts/location/detail.js"></script>
</body>
</html>
