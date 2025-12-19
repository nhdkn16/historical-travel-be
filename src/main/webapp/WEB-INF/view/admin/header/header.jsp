<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<header>
    <nav class="navbar">
        <div class="nav-container">
            <div class="logo">🏛️ HistoricalTravel - Admin</div>
            <ul class="nav-menu">
                <li><a href="/admin" class="${pageContext.request.requestURI.startsWith('/admin') ? 'active' : ''}">📊 Thống kê</a></li>
                <li><a href="/admin/location" class="${pageContext.request.requestURI.startsWith('/admin/location') ? 'active' : ''}">📍 Địa điểm</a></li>
                <li><a href="/admin/post" class="${pageContext.request.requestURI.startsWith('/admin/post') ? 'active' : ''}">📝 Bài viết</a></li>
                <li><a href="/admin/user" class="${pageContext.request.requestURI.startsWith('/admin/user') ? 'active' : ''}">👥 Người dùng</a></li>
                <li><a href="/admin/comment" class="${pageContext.request.requestURI.startsWith('/admin/comment') ? 'active' : ''}">💬 Bình luận</a></li>
                <li><a href="/logout" id="logoutBtn">🚪 Đăng xuất</a></li>
            </ul>
        </div>
    </nav>
</header>
