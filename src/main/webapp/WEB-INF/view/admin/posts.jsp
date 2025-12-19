<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bài viết - Di tích Việt Nam</title>
    <link rel="stylesheet" href="/stylesheets/admin/admin.css">
    <link rel="stylesheet" href="/stylesheets/admin/post.css">
</head>
<body>
    <jsp:include page="/WEB-INF/view/admin/header/header.jsp" />

    <section class="admin-section">
        <div class="container">
            <div class="dashboard-header">
                <h1>📝 Quản lý bài viết / Tin tức</h1>
                <p class="dashboard-subtitle">Tạo và quản lý các bài viết, tin tức về du lịch</p>
            </div>

            <button class="btn-add" onclick="openModal()">➕ Thêm bài viết mới</button>

            <div class="search-box">
                <select id="filterStatus" onchange="searchPosts()">
                    <option value="">Tất cả trạng thái</option>
                    <option value="published">Đã xuất bản</option>
                    <option value="draft">Bản nháp</option>
                    <option value="archived">Lưu trữ</option>
                </select>
            </div>

            <div class="data-table-container">
                <h2>Danh sách bài viết</h2>
                <table class="data-table" id="postsTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tiêu đề</th>
                            <th>Tác giả</th>
                            <th>Ngày đăng</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="post" items="${posts}">
                            <tr>
                                <td>${post.postId}</td>
                                <td><strong>${post.title}</strong></td>
                                <td>${post.user.username}</td>
                                <td>${post.createdAt}</td>
                                <td>
                                    <span class="status-badge">
                                        ${post.status}
                                    </span>
                                </td>
                                <td class="action-buttons">
                                    <form method="post" action="/admin/post/delete/${post.postId}">
                                        <button class="btn-delete">🗑️ Xóa</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <div id="postModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Thêm bài viết mới</h2>
            <form action="/admin/posts/create" method="post" id="postForm">
                <div class="form-group">
                    <label for="title">Tiêu đề</label>
                    <input id="title" name="title" required placeholder="Tiêu đề">
                </div>
                <div class="form-group">
                    <label for="content">Nội dung</label>
                    <textarea id="content" name="content" required></textarea>
                </div>
                <div class="form-group">
                    <label for="locationId">Gắn địa điểm</label>
                    <select id="locationId" name="location.locationId">
                        <option value="">-- Gắn địa điểm --</option>
                        <c:forEach var="loc" items="${locations}">
                            <option value="${loc.locationId}">${loc.name}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="form-group">
                    <label for="status">Trạng thái</label>
                    <select id="status" name="status">
                        <option value="DRAFT">Bản nháp</option>
                        <option value="PUBLISHED">Xuất bản</option>
                        <option value="ARCHIVED">Lưu trữ</option>
                    </select>
                </div>
                <button type="submit" class="btn-submit">💾 Lưu</button>
            </form>
        </div>
    </div>

    <div id="previewModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closePreview()">&times;</span>
            <h2>👁️ Xem trước bài viết</h2>
            <div class="preview-content" id="previewContent"></div>
        </div>
    </div>

    <script src="/scripts/admin/script.js"></script>
    <script src="/scripts/admin/post.js"></script>
</body>
</html>
