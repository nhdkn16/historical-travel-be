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
    <style>
        .action-buttons { display: flex; gap: 8px; flex-wrap: wrap; }
        .btn-edit, .btn-delete, .btn-preview { padding: 6px 12px; border: none; border-radius: 5px; cursor: pointer; font-size: 0.85rem; font-weight: 500; transition: all 0.3s; }
        .btn-edit { background-color: #4CAF50; color: white; }
        .btn-delete { background-color: #f44336; color: white; }
        .btn-preview { background-color: #2196F3; color: white; }
        .btn-edit:hover, .btn-delete:hover, .btn-preview:hover { transform: translateY(-2px); }
        .btn-add { background-color: #1e3c72; color: white; padding: 12px 24px; border: none; border-radius: 5px; cursor: pointer; margin-bottom: 20px; font-size: 1rem; font-weight: 600; transition: all 0.3s; }
        .btn-add:hover { background-color: #2a5298; transform: translateY(-2px); }
        .modal { display: none; position: fixed; z-index: 2000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); overflow-y: auto; padding: 20px 0; }
        .modal-content { background-color: white; margin: 2% auto; padding: 30px; border-radius: 12px; width: 90%; max-width: 800px; animation: slideDown 0.3s; }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-50px); } to { opacity: 1; transform: translateY(0); } }
        .close { color: #aaa; float: right; font-size: 28px; font-weight: bold; cursor: pointer; transition: color 0.3s; }
        .close:hover { color: #000; }
        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 600; }
        .form-group input, .form-group select, .form-group textarea { width: 100%; padding: 10px; border: 2px solid #e0e0e0; border-radius: 6px; font-size: 1rem; font-family: inherit; transition: border-color 0.3s; }
        .form-group input:focus, .form-group select:focus, .form-group textarea:focus { outline: none; border-color: #1e3c72; }
        .form-group textarea { min-height: 150px; resize: vertical; }
        .btn-submit { background-color: #4CAF50; color: white; padding: 12px; border: none; border-radius: 6px; cursor: pointer; font-size: 1rem; width: 100%; font-weight: 600; }
        .search-box { margin-bottom: 20px; display: flex; gap: 10px; flex-wrap: wrap; }
        .search-box input { padding: 10px; flex: 1; max-width: 350px; border: 2px solid #e0e0e0; border-radius: 6px; }
        .search-box select { padding: 10px; border: 2px solid #e0e0e0; border-radius: 6px; }
        .preview-content { padding: 20px; background-color: #f9f9f9; border-radius: 8px; line-height: 1.8; }
        .preview-content h3 { color: #1e3c72; margin-bottom: 10px; }
        .preview-content .meta { color: #666; font-size: 0.9rem; margin-bottom: 15px; padding-bottom: 10px; border-bottom: 2px solid #ddd; }
        .preview-content img { max-width: 100%; border-radius: 8px; margin: 15px 0; }
    </style>
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
                <input type="text" id="searchInput" placeholder="🔍 Tìm kiếm bài viết..." onkeyup="searchPosts()">
                <select id="filterStatus" onchange="searchPosts()">
                    <option value="">Tất cả trạng thái</option>
                    <option value="published">Đã xuất bản</option>
                    <option value="draft">Bản nháp</option>
                    <option value="archived">Lưu trữ</option>
                </select>
            </div>

            <div class="data-table-container">
                <h2>Danh sách bài viết (<span id="postCount">0</span>)</h2>
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
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Edit Modal -->
    <div id="postModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Thêm bài viết mới</h2>
            <form id="postForm">
                <div class="form-group">
                    <label>Tiêu đề bài viết *</label>
                    <input type="text" id="postTitle" required placeholder="Nhập tiêu đề hấp dẫn...">
                </div>

                <div class="form-group">
                    <label>Tóm tắt</label>
                    <textarea id="postSummary" style="min-height: 80px;" placeholder="Tóm tắt nội dung bài viết..."></textarea>
                </div>

                <div class="form-group">
                    <label>Nội dung *</label>
                    <textarea id="postContent" required placeholder="Viết nội dung chi tiết..."></textarea>
                </div>

                <div class="form-group">
                    <label>Ảnh đại diện (URL)</label>
                    <input type="url" id="postImage" placeholder="https://...">
                </div>

                <div class="form-group">
                    <label>Danh mục</label>
                    <select id="postCategory">
                        <option value="di-tich">Di tích</option>
                        <option value="du-lich">Du lịch</option>
                        <option value="van-hoa">Văn hóa</option>
                        <option value="tin-tuc">Tin tức</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Trạng thái</label>
                    <select id="postStatus">
                        <option value="published">Xuất bản</option>
                        <option value="draft">Bản nháp</option>
                        <option value="archived">Lưu trữ</option>
                    </select>
                </div>

                <button type="submit" class="btn-submit">💾 Lưu bài viết</button>
            </form>
        </div>
    </div>

    <!-- Preview Modal -->
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