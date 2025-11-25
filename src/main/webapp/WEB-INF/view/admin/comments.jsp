<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý bình luận - Di tích Việt Nam</title>
    <link rel="stylesheet" href="/stylesheets/admin/admin.css">
    <style>
        .action-buttons { display: flex; gap: 8px; flex-wrap: wrap; }
        .btn-approve, .btn-reject, .btn-hide, .btn-show, .btn-delete, .btn-view { padding: 6px 12px; border: none; border-radius: 5px; cursor: pointer; font-size: 0.85rem; font-weight: 500; transition: all 0.3s; }
        .btn-approve { background-color: #4CAF50; color: white; }
        .btn-reject { background-color: #FF9800; color: white; }
        .btn-hide { background-color: #9E9E9E; color: white; }
        .btn-show { background-color: #2196F3; color: white; }
        .btn-delete { background-color: #f44336; color: white; }
        .btn-view { background-color: #673AB7; color: white; }
        .btn-approve:hover, .btn-reject:hover, .btn-hide:hover, .btn-show:hover, .btn-delete:hover, .btn-view:hover { transform: translateY(-2px); }
        .search-box { margin-bottom: 20px; display: flex; gap: 10px; flex-wrap: wrap; }
        .search-box input { padding: 10px; flex: 1; max-width: 350px; border: 2px solid #e0e0e0; border-radius: 6px; }
        .search-box select { padding: 10px; border: 2px solid #e0e0e0; border-radius: 6px; }
        .status-pending { background-color: #fff9c4; color: #f57f17; }
        .status-rejected { background-color: #ffcdd2; color: #c62828; }
        .status-hidden { background-color: #e0e0e0; color: #616161; }
        .comment-content { max-width: 350px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; cursor: help; }
        .rating-stars { color: #FFB300; font-size: 1.1rem; }
        .modal { display: none; position: fixed; z-index: 2000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); overflow-y: auto; padding: 20px 0; }
        .modal-content { background-color: white; margin: 5% auto; padding: 30px; border-radius: 12px; width: 90%; max-width: 700px; animation: slideDown 0.3s; }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-50px); } to { opacity: 1; transform: translateY(0); } }
        .close { color: #aaa; float: right; font-size: 28px; font-weight: bold; cursor: pointer; transition: color 0.3s; }
        .close:hover { color: #000; }
        .comment-detail { line-height: 1.8; }
        .comment-detail .meta { background-color: #f5f5f5; padding: 20px; border-radius: 8px; margin: 15px 0; }
        .comment-detail .meta p { margin: 8px 0; }
        .comment-detail .content-box { background-color: #f9f9f9; padding: 20px; border-radius: 8px; line-height: 1.8; margin-top: 15px; border-left: 4px solid #1e3c72; }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/view/admin/header/header.jsp" />

    <section class="admin-section">
        <div class="container">
            <div class="dashboard-header">
                <h1>💬 Quản lý bình luận / Đánh giá</h1>
                <p class="dashboard-subtitle">Duyệt, ẩn/hiện và xóa các bình luận, đánh giá của người dùng</p>
            </div>

            <div class="search-box">
                <input type="text" id="searchInput" placeholder="🔍 Tìm kiếm bình luận..." onkeyup="searchComments()">
                <select id="filterStatus" onchange="searchComments()">
                    <option value="">Tất cả trạng thái</option>
                    <option value="approved">Đã duyệt</option>
                    <option value="pending">Chờ duyệt</option>
                    <option value="rejected">Từ chối</option>
                    <option value="hidden">Đã ẩn</option>
                </select>
                <select id="filterRating" onchange="searchComments()">
                    <option value="">Tất cả đánh giá</option>
                    <option value="5">⭐⭐⭐⭐⭐ 5 sao</option>
                    <option value="4">⭐⭐⭐⭐ 4 sao</option>
                    <option value="3">⭐⭐⭐ 3 sao</option>
                    <option value="2">⭐⭐ 2 sao</option>
                    <option value="1">⭐ 1 sao</option>
                </select>
            </div>

            <div class="data-table-container">
                <h2>Danh sách bình luận (<span id="commentCount">0</span>)</h2>
                <table class="data-table" id="commentsTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Người dùng</th>
                            <th>Nội dung</th>
                            <th>Đối tượng</th>
                            <th>Đánh giá</th>
                            <th>Ngày</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </section>

    <div id="commentModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2>👁️ Chi tiết bình luận</h2>
            <div class="comment-detail" id="commentDetail"></div>
        </div>
    </div>

    <script src="/scripts/admin/script.js"></script>
    <script src="/scripts/admin/comment.js"></script>
</body>
</html>