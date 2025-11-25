<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelVN - Đặt Vé Du Lịch</title>
    <link rel="stylesheet" href="/stylesheets/location/service.css">
</head>
<body>
    <div class="header">
        <div class="container">
            <div class="logo">🌍 Dịch vụ</div>
            <nav class="nav">
    <ul>
        <li><a href="/">Trang chủ</a></li>
        <li><a href="/social">Cộng đồng</a></li>
        <li><a href="/service">Dịch vụ</a></li>
        <li><a href="/contact">Liên hệ</a></li>
        <li><a href="/login">Đăng nhập</a></li>
        <li><a href="#tours">Tours</a></li>
        <li><a href="#bookings">Đặt Vé Của Tôi</a></li>
    </ul>
</nav>
        </div>
    </div>

    <div class="hero">
        <h1>Khám Phá Thế Giới Cùng TravelVN</h1>
        <p>Đặt tour du lịch dễ dàng, giá tốt nhất</p>
        
        <!-- Tìm kiếm địa điểm -->
        <div class="search-box">
            <input type="text" id="searchInput" placeholder="Tìm kiếm địa điểm du lịch... (VD: Đà Nẵng, Hạ Long, Paris)">
            <button id="searchBtn">🔍 Tìm Kiếm</button>
        </div>
        <div id="searchResults" class="search-results"></div>
    </div>

    <div class="container" id="tours">
        <h2 class="section-title">🏖️ Tour Du Lịch Nổi Bật</h2>
        <div class="tours-list" id="toursList">
            <!-- Tours sẽ được thêm vào đây bằng JavaScript -->
        </div>
    </div>

    <div class="container" id="bookings">
        <div class="bookings-section">
            <h2>🎫 Danh Sách Đặt Vé Của Bạn</h2>
            <div class="success-message" id="successMessage">
                ✅ Đặt vé thành công! Chúng tôi sẽ liên hệ với bạn sớm nhất.
            </div>
            <div id="bookingsList">
                <div class="empty-state">
                    <svg viewBox="0 0 24 24" fill="currentColor">
                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/>
                    </svg>
                    <p>Chưa có đặt vé nào. Hãy chọn tour yêu thích và đặt ngay!</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal Đặt Vé -->
    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Đặt Vé Du Lịch</h2>
                <span class="close" onclick="closeBookingModal()">&times;</span>
            </div>
            <div class="modal-body">
                <form id="bookingForm">
                    <input type="hidden" id="tourId">
                    <input type="hidden" id="tourName">
                    <input type="hidden" id="tourPrice">
                    
                    <div class="form-group">
                        <label>Họ và Tên *</label>
                        <input type="text" id="customerName" required placeholder="Nguyễn Văn A">
                    </div>

                    <div class="form-group">
                        <label>Số Điện Thoại *</label>
                        <input type="tel" id="customerPhone" required placeholder="0912345678">
                    </div>

                    <div class="form-group">
                        <label>Email *</label>
                        <input type="email" id="customerEmail" required placeholder="email@example.com">
                    </div>

                    <div class="form-group">
                        <label>Ngày Khởi Hành *</label>
                        <input type="date" id="departureDate" required>
                    </div>

                    <div class="form-group">
                        <label>Số Người *</label>
                        <select id="numPeople" required>
                            <option value="1">1 người</option>
                            <option value="2">2 người</option>
                            <option value="3">3 người</option>
                            <option value="4">4 người</option>
                            <option value="5">5 người</option>
                            <option value="6">6+ người</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Ghi Chú</label>
                        <input type="text" id="notes" placeholder="Yêu cầu đặc biệt (nếu có)">
                    </div>

                    <div class="form-group">
                        <label>Phương Thức Thanh Toán *</label>
                        <select id="paymentMethod" required>
                            <option value="">-- Chọn phương thức --</option>
                            <option value="momo">💰 Ví MoMo</option>
                            <option value="zalopay">💳 ZaloPay</option>
                            <option value="vnpay">🏦 VNPay</option>
                            <option value="bank">🏧 Chuyển khoản ngân hàng</option>
                            <option value="credit">💳 Thẻ tín dụng/ghi nợ</option>
                        </select>
                    </div>

                    <div class="total-amount">
                        <span>Tổng thanh toán:</span>
                        <span id="totalAmount" class="total-price">0đ</span>
                    </div>

                    <button type="submit" class="btn-submit">💳 Thanh Toán & Đặt Vé</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Thanh Toán -->
    <div id="paymentModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Thanh Toán</h2>
                <span class="close" onclick="closePaymentModal()">&times;</span>
            </div>
            <div class="modal-body payment-processing">
                <div id="paymentStep1" class="payment-step">
                    <div class="spinner"></div>
                    <h3 id="paymentStatus">Đang tạo mã thanh toán...</h3>
                    <p id="paymentMessage">Vui lòng đợi trong giây lát</p>
                </div>
                
                <div id="paymentStep2" class="payment-step" style="display: none;">
                    <h3 class="payment-method-title">
                        <span id="paymentMethodIcon"></span>
                        <span id="paymentMethodName"></span>
                    </h3>
                    
                    <div class="qr-code-container">
                        <img id="qrCodeImage" src="" alt="QR Code" class="qr-code">
                    </div>
                    
                    <div class="payment-info">
                        <p class="payment-amount">
                            <strong>Số tiền:</strong> 
                            <span id="paymentAmountDisplay" class="amount-highlight"></span>
                        </p>
                        <p class="payment-instruction">
                            📱 Mở ứng dụng <strong id="appName"></strong> và quét mã QR để thanh toán
                        </p>
                    </div>
                    
                    <div class="bank-transfer-info" id="bankTransferInfo" style="display: none;">
                        <div class="bank-info-box">
                            <h4>📋 Thông tin chuyển khoản</h4>
                            <p><strong>Ngân hàng:</strong> MB bank</p>
                            <p><strong>Số tài khoản:</strong> 0799331839</p>
                            <p><strong>Chủ tài khoản:</strong> CAO HUY HOANG</p>
                            <p><strong>Số tiền:</strong> <span id="bankAmount"></span></p>
                            <p><strong>Nội dung:</strong> <span id="transferContent"></span></p>
                        </div>
                    </div>
                    
                    <div class="timer-container">
                        <p>⏰ Mã QR có hiệu lực trong: <span id="countdown" class="countdown">05:00</span></p>
                    </div>
                    
                    <button class="btn-check-payment" onclick="checkPaymentStatus()">
                        🔄 Kiểm Tra Thanh Toán
                    </button>
                </div>
                
                <div id="paymentStep3" class="payment-step" style="display: none;">
                    <div class="payment-success-icon">✅</div>
                    <h3 class="payment-success">Thanh toán thành công!</h3>
                    <p id="successMessage"></p>
                    <button class="btn-close-payment" onclick="closePaymentModal()">
                        Đóng
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script src="/scripts/location/service.js"></script>
</body>
</html>