<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mạng xã hội</title>
    <link rel="stylesheet" href="/stylesheets/socialNetwork/social.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/4.7.2/socket.io.js"></script>
</head>
<body>
        <header>
        <div>
            <nav class="nav">
                <ul class="menu">
                    <li><a href="/">Trang chủ</a></li>
                    <li><a href="/social">Cộng đồng</a></li>
                    <li><a href="/service">Dịch vụ</a></li>
                    <li><a href="/contact">Liên hệ</a></li>
                    <li>
                        <a href="/login" role="button" aria-pressed="true">Đăng nhập/</a>
                        <a href="/register" role="button" aria-pressed="true">Đăng ký</a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>
   <div class="app-container">
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-item active" data-section="feed">
                <i>🏠</i>
            </div>
            <div class="sidebar-item" data-section="chat">
                <i>💬</i>
            </div>
            <div class="sidebar-item" data-section="friends">
                <i>👥</i>
            </div>
            <div class="sidebar-item">
                <i>🔔</i>
            </div>
            <div class="sidebar-profile">
                <div class="profile-avatar">A</div>
                <div class="profile-info">
                    <div class="profile-name">Hoàng Hí Hỉnh</div>
                    <div class="profile-link" >
                        <a href="/profile">Xem profile </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
            <div class="header">
                <input type="text" class="search-bar" placeholder="Tìm kiếm bạn bè, bài viết...">
                <div class="header-avatar">A</div>
            </div>

            <!-- Create Post -->
            <div class="post-input">
                <div class="avatar-small">A</div>
                <textarea class="post-textarea" placeholder="Bạn đang nghĩ gì? Chia sẻ với mọi người..." 
                id="postTextarea"></textarea>
                <div class="post-actions">
                    <button class="post-action-btn">📷 Ảnh</button>
                    <button class="post-action-btn">🎥 Video</button>
                    <button class="post-action-btn post-btn" id="postBtn">Đăng bài</button>
                </div>
            </div>

            <!-- Posts Feed -->
            <div class="posts-feed" id="postsFeed">
                <!-- Posts will be dynamically added here -->
            </div>
        </div>

        <!-- Chat Panel -->
        <div class="chat-panel" id="chatPanel">
            <div class="chat-header">
                <div class="avatar-small chat-avatar">B</div>
                <div class="chat-user-info">
                    <div class="chat-user-name">Bình </div>
                    <div class="chat-user-status">Đang hoạt động</div>
                </div>
                <button class="close-chat-btn" id="closeChat">×</button>
            </div>
            <div class="chat-messages" id="chatMessages"></div>
            <div class="chat-input">
                <input type="text" placeholder="Nhắn tin..." id="chatInput">
                <button class="send-btn" id="sendBtn">➤</button>
            </div>
        </div>
    </div>

    <!--Notification-->
    <div class="notification" id="notification"></div>
    <script src="/scripts/socialNetwork/social.js"></script>
</body>
</html>