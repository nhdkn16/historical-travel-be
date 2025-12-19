<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Người Dùng</title>
    <link rel="stylesheet" href="/stylesheets/socialNetwork/profile.css">
</head>
<body>
    <jsp:include page="/WEB-INF/view/user/header/main-header.jsp" />
    
    <div class="container">
        <div class="header">
            <h1>✨ Profile Của Bạn</h1>
            <p>Điền thông tin để tạo profile của bạn</p>
        </div>

        <div class="profile-content">
            <form id="profileForm">
                <div class="avatar-section">
                    <div class="avatar-preview" id="avatarPreview">
                        <span class="avatar-placeholder">👤</span>
                    </div>
                    <input type="file" id="avatarInput" accept="image/*">
                    <button type="button" class="upload-btn" onclick="document.getElementById('avatarInput').click()">
                        📷 Tải ảnh đại diện
                    </button>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Tên người dùng <span class="required">*</span></label>
                        <input type="text" id="username" placeholder="Nhập tên của bạn" required>
                    </div>

                    <div class="form-group">
                        <label>Số điện thoại <span class="required">*</span></label>
                        <input type="tel" id="phone" placeholder="Nhập số điện thoại" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Email <span class="required">*</span></label>
                    <input type="email" id="email" placeholder="example@email.com" required>
                </div>

                <div class="form-row">
                    <div class="form-group">
                        <label>Nơi ở <span class="required">*</span></label>
                        <input type="text" id="address" placeholder="Thành phố, Quốc gia" required>
                    </div>

                    <div class="form-group">
                        <label>Công việc <span class="required">*</span></label>
                        <input type="text" id="job" placeholder="Nghề nghiệp của bạn" required>
                    </div>
                </div>

                <div class="form-group">
                    <label>Tiểu sử <span class="optional">(Không bắt buộc)</span></label>
                    <textarea id="bio" placeholder="Viết vài dòng về bản thân bạn..."></textarea>
                </div>

                <button type="submit" class="submit-btn">💾 Lưu Profile</button>
            </form>

            <div class="profile-preview" id="profilePreview">
                <div class="preview-header">
                    <div class="preview-avatar" id="previewAvatar">
                        <span class="avatar-placeholder">👤</span>
                    </div>
                    <div class="preview-name" id="previewName"></div>
                    <div class="preview-job" id="previewJob"></div>
                </div>

                <div class="preview-info">
                    <div class="info-item">
                        <span class="info-label">📧 Email:</span>
                        <span class="info-value" id="previewEmail"></span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">📱 Điện thoại:</span>
                        <span class="info-value" id="previewPhone"></span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">📍 Nơi ở:</span>
                        <span class="info-value" id="previewAddress"></span>
                    </div>
                    <div class="info-item" id="bioSection" style="display: none;">
                        <span class="info-label">📝 Tiểu sử:</span>
                        <span class="info-value" id="previewBio"></span>
                    </div>
                </div>

                <button type="button" class="edit-btn" onclick="editProfile()">✏️ Chỉnh sửa</button>
            </div>
        </div>
    </div>
    <script src="/scripts/socialNetwork/profile.js"></script>
</body>
</html>