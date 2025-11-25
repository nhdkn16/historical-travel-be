<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liên hệ - TravelVN</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <link rel="stylesheet" href="/stylesheets/contact/contact.css">
</head>
<body>
    <div class="container">

        <!-- Left Side - Contact Info -->
        <div class="contact-info">
            <h2>Liên hệ với chúng tôi</h2>
            <p>Chúng tôi luôn sẵn sàng lắng nghe và hỗ trợ bạn. Hãy gửi tin nhắn cho chúng tôi!</p>

            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div class="info-content">
                    <h4>Địa chỉ</h4>
                    <p>Hà My Đông B, phường Điện Bàn Đông, Điện Bàn, Đà Nẵng</p>
                </div>
            </div>

            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-phone"></i>
                </div>
                <div class="info-content">
                    <h4>Điện thoại</h4>
                    <p>+84 799 331 839</p>
                </div>
            </div>

            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="info-content">
                    <h4>Email</h4>
                    <p>hoangch.24itb@vku.udn.vn</p>
                </div>
            </div>

            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="info-content">
                    <h4>Giờ làm việc</h4>
                    <p>Thứ 2 - Thứ 7: 8:00 - 18:00</p>
                </div>
            </div>

            <div class="social-links">
                <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
            </div>
        </div>

        <!-- Right Side - Contact Form -->
        <div class="contact-form">
            <h2>Gửi tin nhắn</h2>
            <p class="subtitle">Điền thông tin bên dưới và chúng tôi sẽ phản hồi sớm nhất có thể.</p>

            <!-- Alert Messages -->
            <div class="alert alert-success" id="successAlert">
                <i class="fas fa-check-circle"></i>
                <span>Gửi tin nhắn thành công! Chúng tôi sẽ liên hệ với bạn sớm.</span>
            </div>
            <div class="alert alert-error" id="errorAlert">
                <i class="fas fa-exclamation-circle"></i>
                <span>Có lỗi xảy ra. Vui lòng thử lại sau!</span>
            </div>

            <form id="contactForm" action="https://formspree.io/f/mgvrwlgv" method="POST">
                <div class="form-group">
                    <label for="name">Họ và tên <span class="required">*</span></label>
                    <input type="text" id="name" name="name" placeholder="Nguyễn Văn A" required>
                    <span class="error-message">Vui lòng nhập họ tên</span>
                </div>

                <div class="form-group">
                    <label for="email">Email <span class="required">*</span></label>
                    <input type="email" id="email" name="email" placeholder="example@email.com" required>
                    <span class="error-message">Vui lòng nhập email hợp lệ</span>
                </div>

                <div class="form-group">
                    <label for="message">Tin nhắn <span class="required">*</span></label>
                    <textarea id="message" name="message" placeholder="Nhập nội dung tin nhắn của bạn..." required></textarea>
                    <span class="error-message">Vui lòng nhập tin nhắn</span>
                </div>

                <div class="button-group">
                    <button type="submit" class="btn-submit" id="submitBtn">
                        <span class="btn-text">Gửi tin nhắn</span>
                    </button>

                    <!-- Nút quay lại trang chủ -->
                    <a href="/" class="btn-back">
                        <i class="fas fa-arrow-left"></i> Quay lại trang chủ
                    </a>
                </div>
            </form>
        </div>
    </div>

    <script src="/scripts/contact/contact.js"></script>
</body>
</html>