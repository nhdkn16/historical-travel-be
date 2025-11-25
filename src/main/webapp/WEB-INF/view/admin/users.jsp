<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý người dùng - Di tích Việt Nam</title>
    <link rel="stylesheet" href="/stylesheets/admin/admin.css">
    <style>
        .action-buttons { display: flex; gap: 8px; flex-wrap: wrap; }
        .btn-edit, .btn-block, .btn-unblock, .btn-role { padding: 6px 12px; border: none; border-radius: 5px; cursor: pointer; font-size: 0.85rem; font-weight: 500; transition: all 0.3s; }
        .btn-edit { background-color: #4CAF50; color: white; }
        .btn-block { background-color: #f44336; color: white; }
        .btn-unblock { background-color: #2196F3; color: white; }
        .btn-role { background-color: #FF9800; color: white; }
        .btn-edit:hover, .btn-block:hover, .btn-unblock:hover, .btn-role:hover { transform: translateY(-2px); }
        .btn-add { background-color: #1e3c72; color: white; padding: 12px 24px; border: none; border-radius: 5px; cursor: pointer; margin-bottom: 20px; font-size: 1rem; font-weight: 600; transition: all 0.3s; }
        .btn-add:hover { background-color: #2a5298; transform: translateY(-2px); }
        .modal { display: none; position: fixed; z-index: 2000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); overflow-y: auto; padding: 20px 0; }
        .modal-content { background-color: white; margin: 5% auto; padding: 30px; border-radius: 12px; width: 90%; max-width: 600px; animation: slideDown 0.3s; }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-50px); } to { opacity: 1; transform: translateY(0); } }
        .close { color: #aaa; float: right; font-size: 28px; font-weight: bold; cursor: pointer; transition: color 0.3s; }
        .close:hover { color: #000; }
        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 600; }
        .form-group input, .form-group select { width: 100%; padding: 10px; border: 2px solid #e0e0e0; border-radius: 6px; font-size: 1rem; transition: border-color 0.3s; }
        .form-group input:focus, .form-group select:focus { outline: none; border-color: #1e3c72; }
        .btn-submit { background-color: #4CAF50; color: white; padding: 12px; border: none; border-radius: 6px; cursor: pointer; font-size: 1rem; width: 100%; font-weight: 600; }
        .search-box { margin-bottom: 20px; display: flex; gap: 10px; flex-wrap: wrap; }
        .search-box input { padding: 10px; flex: 1; max-width: 300px; border: 2px solid #e0e0e0; border-radius: 6px; }
        .search-box select { padding: 10px; border: 2px solid #e0e0e0; border-radius: 6px; }
        .status-blocked { background-color: #ffcdd2; color: #c62828; }
        .role-badge { padding: 5px 12px; border-radius: 15px; font-size: 0.85rem; font-weight: 600; display: inline-block; }
        .role-admin { background-color: #e1bee7; color: #6a1b9a; }
        .role-user { background-color: #c5cae9; color: #303f9f; }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/view/admin/header/header.jsp" />

    <section class="admin-section">
        <div class="container">
            <div class="dashboard-header">
                <h1>👥 Quản lý người dùng</h1>
                <p class="dashboard-subtitle">Xem danh sách, cấp quyền và quản lý người dùng hệ thống</p>
            </div>

            <button class="btn-add" onclick="openModal()">➕ Thêm người dùng mới</button>

            <div class="search-box">
                <input type="text" id="searchInput" placeholder="🔍 Tìm kiếm người dùng..." onkeyup="searchUsers()">
                <select id="filterRole" onchange="searchUsers()">
                    <option value="">Tất cả vai trò</option>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
                <select id="filterStatus" onchange="searchUsers()">
                    <option value="">Tất cả trạng thái</option>
                    <option value="active">Hoạt động</option>
                    <option value="blocked">Bị chặn</option>
                </select>
            </div>

            <div class="data-table-container">
                <h2>Danh sách người dùng (<span id="userCount">0</span>)</h2>
                <table class="data-table" id="usersTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên đăng nhập</th>
                            <th>Email</th>
                            <th>Vai trò</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </section>

    <div id="userModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Thêm người dùng mới</h2>
            <form id="userForm">
                <input type="hidden" id="userId">
                
                <div class="form-group">
                    <label>Tên đăng nhập *</label>
                    <input type="text" id="username" required placeholder="username123">
                </div>

                <div class="form-group">
                    <label>Email *</label>
                    <input type="email" id="email" required placeholder="email@example.com">
                </div>

                <div class="form-group">
                    <label>Mật khẩu <span id="passwordNote" style="color: #666; font-weight: normal;">(Bắt buộc)</span></label>
                    <input type="password" id="password" placeholder="Nhập mật khẩu">
                </div>

                <div class="form-group">
                    <label>Họ tên</label>
                    <input type="text" id="fullname" placeholder="Nguyễn Văn A">
                </div>

                <div class="form-group">
                    <label>Vai trò</label>
                    <select id="role">
                        <option value="user">User</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>

                <div class="form-group">
                    <label>Trạng thái</label>
                    <select id="status">
                        <option value="active">Hoạt động</option>
                        <option value="blocked">Bị chặn</option>
                    </select>
                </div>

                <button type="submit" class="btn-submit">💾 Lưu người dùng</button>
            </form>
        </div>
    </div>

    <script src="/scripts/admin/script.js"></script>
    <script src="/scripts/admin/user.js"></script>
</body>
</html>