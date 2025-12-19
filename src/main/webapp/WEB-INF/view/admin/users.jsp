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
    <link rel="stylesheet" href="/stylesheets/admin/user.css">
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
                <h2>Danh sách người dùng</h2>
                <table class="data-table" id="usersTable">
                    <thead>
                        <tr>
                            <th>Tên đăng nhập</th>
                            <th>Email</th>
                            <th>Vai trò</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${users}" var="u">
                            <tr>
                                <td><strong>${u.username}</strong></td>
                                <td>${u.email}</td>
                                <td>
                                    <span class="role-badge ${u.role == 'ADMIN' ? 'role-admin' : 'role-user'}">
                                        ${u.role}
                                    </span>
                                </td>
                                <td>
                                    <span class="status-badge ${u.status == 'ACTIVE' ? 'status-active' : 'status-blocked'}">
                                        ${u.status}
                                    </span>
                                </td>
                                <td class="action-buttons">
                                    <form action="/admin/user/toggle-role/${u.userId}" method="post">
                                        <button class="btn-role">🔄 Vai trò</button>
                                    </form>

                                    <c:choose>
                                        <c:when test="${u.status == 'ACTIVE'}">
                                            <form action="/admin/user/block/${u.userId}" method="post">
                                                <button class="btn-block">🚫 Chặn</button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <form action="/admin/user/unblock/${u.userId}" method="post">
                                                <button class="btn-unblock">✅ Mở</button>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <div id="userModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Thêm người dùng mới</h2>
            <form:form id="userForm" modelAttribute="userForm" method="post" action="/admin/user/create">
                <form:hidden path="userId" id="userId"/>
                <div class="form-group">
                    <label>Tên đăng nhập *</label>
                    <form:input path="username" id="username" cssClass="" required="true" placeholder="username123"/>
                </div>
                <div class="form-group">
                    <label>Email *</label>
                    <form:input path="email" id="email" type="email" required="true" placeholder="email@example.com"/>
                </div>

                <div class="form-group">
                    <label>Mật khẩu
                        <span id="passwordNote" style="color: #666; font-weight: normal;">
                            (${userForm.userId == null ? 'Bắt buộc' : 'Để trống nếu không đổi'})
                        </span>
                    </label>

                    <form:password path="password" id="password" placeholder="Nhập mật khẩu"/>
                </div>

                <div class="form-group">
                    <label>Vai trò</label>
                    <form:select path="role" id="role">
                        <form:option value="USER">User</form:option>
                        <form:option value="ADMIN">Admin</form:option>
                    </form:select>
                </div>
                <div class="form-group">
                    <label>Trạng thái</label>
                    <form:select path="status" id="status">
                        <form:option value="ACTIVE">Hoạt động</form:option>
                        <form:option value="BANNED">Bị chặn</form:option>
                    </form:select>
                </div>
                <button type="submit" class="btn-submit">💾 Lưu người dùng</button>
            </form:form>
        </div>
    </div>

    <script src="/scripts/admin/script.js"></script>
    <script src="/scripts/admin/user.js"></script>
</body>
</html>
