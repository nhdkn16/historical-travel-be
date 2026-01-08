<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TravelVN - Dịch Vụ</title>
    <link rel="stylesheet" href="/stylesheets/location/service.css">
</head>
<body>
    <jsp:include page="/WEB-INF/view/user/header/main-header.jsp" />

    <div class="hero">
        <h1>Khám Phá Thế Giới Cùng TravelVN</h1>
        <p>Đặt tour du lịch dễ dàng, giá tốt nhất</p>

        <form action="/service" method="get" class="search-box">
            <input type="text" name="keyword" placeholder="Tìm kiếm địa điểm..." value="${keyword}">
            <button type="submit">🔍 Tìm Kiếm</button>
        </form>
    </div>

    <div class="container" id="tours">
        <h2 class="section-title">🏖️ Tour Du Lịch Nổi Bật</h2>

        <div class="tours-list">
            <c:forEach var="t" items="${tours}">
                <div class="tour-card">
                    <h3>${t.name}</h3>
                    <p class="location">📍 ${t.locationName}</p>
                    <p class="price">💰 Giá từ: <span>${t.pricePerPerson}đ/người</span></p>

                    <button class="btn-detail"
                        onclick="openBookingModal(
                            '${t.tourId}',
                            '${t.defaultScheduleId}',
                            '${fn:escapeXml(t.name)}'
                        )">
                        Đặt Vé
                    </button>
                </div>
            </c:forEach>
        </div>

        <div class="pagination">
            <c:if test="${totalPages > 1}">
                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <a class="page-btn ${i == currentPage ? 'active' : ''}"
                    href="/service?page=${i}&keyword=${keyword}">
                        ${i + 1}
                    </a>
                </c:forEach>
            </c:if>
        </div>
    </div>

    <c:if test="${not empty success}">
        <div class="success-toast">
            ${success}
        </div>
    </c:if>

    <div id="bookingModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Đặt Vé Du Lịch</h2>
                <span class="close" onclick="closeBookingModal()">&times;</span>
            </div>

            <form:form method="post" modelAttribute="bookingRequest" id="bookingForm">
                <form:hidden path="tourId" id="modalTourId"/>
                <form:hidden path="scheduleId" id="modalScheduleId"/>

                <div class="form-group">
                    <label>Họ và Tên *</label>
                    <form:input path="customerName" id="customerName" required="true"/>
                </div>

                <div class="form-group">
                    <label>SĐT *</label>
                    <form:input path="customerPhone" id="customerPhone" required="true"/>
                </div>

                <div class="form-group">
                    <label>Email *</label>
                    <form:input path="customerEmail" id="customerEmail" required="true"/>
                </div>

                <c:if test="${not empty schedulesForModal}">
                    <div class="form-group">
                        <label>Chọn ngày khởi hành *</label>
                        <form:select path="scheduleId">
                            <c:forEach var="s" items="${schedulesForModal}">
                                <form:option value="${s.scheduleId}" label="${s.startDate} (Chỗ: ${s.availableSlots})"/>
                            </c:forEach>
                        </form:select>
                    </div>
                </c:if>

                <div class="form-group">
                    <label>Số Người *</label>
                    <form:select path="participantCount">
                        <form:option value="1" label="1 người"/>
                        <form:option value="2" label="2 người"/>
                        <form:option value="3" label="3 người"/>
                        <form:option value="4" label="4 người"/>
                        <form:option value="5" label="5 người"/>
                        <form:option value="6" label="6+ người"/>
                    </form:select>
                </div>

                <div class="form-group">
                    <label>Ghi chú</label>
                    <form:input path="notes"/>
                </div>

                <div class="form-group">
                    <label>Phương Thức Thanh Toán *</label>
                    <form:select path="paymentMethod" id="paymentMethod">
                        <form:option value="momo" label="MoMo"/>
                        <form:option value="zalopay" label="ZaloPay"/>
                        <form:option value="vnpay" label="VNPay"/>
                        <form:option value="bank" label="Chuyển khoản ngân hàng"/>
                        <form:option value="credit" label="Thẻ tín dụng"/>
                    </form:select>
                </div>

                <button type="submit" class="btn-submit">💳 Thanh Toán & Đặt Vé</button>
            </form:form>
        </div>
    </div>

    <div id="paymentModal" class="modal">
        <div class="modal-content">

            <div id="paymentStep1">
                <h3>⏳ Đang tạo mã QR...</h3>
            </div>

            <div id="paymentStep2" style="display:none;">
                <h3>📱 Quét mã QR để thanh toán</h3>
                <img id="qrCodeImage" />
                <p>⏱️ Thời gian còn lại: <span id="countdown">05:00</span></p>
            </div>

            <div id="paymentStep3" style="display:none;">
                <h3>🎉 Thanh toán thành công!</h3>
                <div id="successMessage"></div>
                <button onclick="finish()">Hoàn tất</button>
            </div>
        </div>
    </div>

    <script src="/scripts/location/service.js"></script>
</body>
</html>
