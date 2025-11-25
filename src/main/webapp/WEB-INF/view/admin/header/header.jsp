<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Navigation Bar -->
<header>
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">🏛️ Di tích Việt Nam - Admin</div>
            <ul class="nav-menu">
                <li><a href="/admin" class="active">📊 Thống kê</a></li>
                <li><a href="/admin/location">📍 Địa điểm</a></li>
                <li><a href="/admin/post">📝 Bài viết</a></li>
                <li><a href="/admin/user">👥 Người dùng</a></li>
                <li><a href="/admin/comment">💬 Bình luận</a></li>
                <li><a href="#" id="logoutBtn">🚪 Đăng xuất</a></li>
            </ul>
        </div>
    </nav>
</header>
