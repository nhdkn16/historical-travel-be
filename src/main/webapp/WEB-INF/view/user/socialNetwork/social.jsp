<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Cộng đồng</title>
    <link rel="stylesheet" href="/stylesheets/socialNetwork/social.css">
</head>
<body>

<jsp:include page="/WEB-INF/view/user/header/main-header.jsp" />

<div class="app-container">

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-item active">🏠</div>
        <div class="sidebar-item">💬</div>
        <div class="sidebar-item">👥</div>
        <div class="sidebar-item">🔔</div>

        <c:if test="${not empty user}">
            <div class="sidebar-profile">
                <div class="profile-avatar">${user.username.substring(0,1)}</div>
                <div class="profile-info">
                    <div class="profile-name">${user.username}</div>
                    <a href="/profile">Xem profile</a>
                </div>
            </div>
        </c:if>
    </div>

    <!-- Main Content -->
    <div class="main-content">

        <!-- Header Search
        <div class="header">
            <input type="text" class="search-bar" placeholder="Tìm kiếm bạn bè, bài viết...">
            <div class="header-avatar">${user != null ? user.username.substring(0,1) : 'A'}</div>
        </div> -->

        <!-- Create Post -->
        <c:if test="${not empty user}">
            <div class="post-input">
                <div class="avatar-small">${user.username.substring(0,1)}</div>
                <form class="post-action" method="post" action="/social/post" enctype="multipart/form-data">
                    <input type="text" name="title" class="title-input" placeholder="Tiêu đề bài viết" required>
                    <textarea name="content" class="post-textarea" placeholder="Bạn đang nghĩ gì?" required></textarea>
                    <div class="btnn">
                        <label for="images" class="custom-upload">
                            <span>Chọn ảnh</span>
                            <input type="file" id="images" name="images" multiple>
                        </label>
                        <div class="post-action-btn">
                            <button type="submit" class="post-btn">Đăng bài</button>
                        </div>
                    </div>
                </form>
            </div>
        </c:if>

        <!-- Posts Feed -->
        <div class="posts-feed">
            <c:forEach items="${posts}" var="p">
                <div class="post-card">

                    <div class="post-header">
                        <div class="avatar-small">${p.user.username.substring(0,1)}</div>
                        <div>
                            <div class="post-author">${p.user.username}</div>
                            <div class="post-date">${p.createdAt}</div>
                        </div>
                    </div>

                    <div class="post-title">${p.title}</div>
                    <div class="post-content">${p.content}</div>

                    <div class="post-images post-images-grid">
                        <c:forEach items="${p.tempImages}" var="img">
                            <img src="/social/image?path=${img.imageUrl}" alt="${img.altText}" class="post-img"/>
                        </c:forEach>
                    </div>

                    <div class="post-actions">
                        <a href="/social/like/${p.postId}" class="action-btn like-btn">❤️</a>
                        <span>${p.likeCount != null ? p.likeCount : 0} lượt thích</span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
