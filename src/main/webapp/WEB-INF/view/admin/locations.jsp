<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý địa điểm - Di tích Việt Nam</title>
    <link rel="stylesheet" href="/stylesheets/admin/admin.css">
    <link rel="stylesheet" href="/stylesheets/admin/location.css">
</head>
<body>
    <jsp:include page="/WEB-INF/view/admin/header/header.jsp" />

    <section class="admin-section">
        <div class="container">
            <div class="dashboard-header">
                <h1>📍 Quản lý địa điểm du lịch</h1>
                <p class="dashboard-subtitle">Thêm, sửa, xóa các địa điểm du lịch và di tích lịch sử</p>
            </div>

            <button class="btn-add" id="btnAddLocation">➕ Thêm địa điểm mới</button>

            <div class="search-box">
                <form method="get" action="/admin/location/search" class="search-box">
                    <input name="keyword" placeholder="🔍 Tìm kiếm địa điểm...">
                </form>
            </div>

            <div class="data-table-container">
                <h2>Danh sách địa điểm</h2>
                <table class="data-table" id="locationsTable">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Tên địa điểm</th>
                            <th>Thành phố</th>
                            <th>Tọa độ (Lat, Lng)</th>
                            <th>Trạng thái</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="loc" items="${locations}">
                            <tr>
                                <td>${loc.locationId}</td>
                                <td>${loc.name}</td>
                                <td>${loc.province}</td>
                                <td>${loc.latitude}, ${loc.longitude}</td>
                                <td>${loc.status}</td>
                                <td class="action-buttons">

                                    <button class="btn-edit"
                                        data-id="${loc.locationId}"
                                        data-name="${loc.name}"
                                        data-desc="${loc.description}"
                                        data-address="${loc.address}"
                                        data-province="${loc.province}"
                                        data-type="${loc.type}"
                                        data-period="${loc.historicalPeriod}"
                                        data-lat="${loc.latitude}"
                                        data-lng="${loc.longitude}"
                                        data-image="${loc.mainImageUrl}"
                                        data-status="${loc.status}">
                                        ✏️ Sửa
                                    </button>


                                    <form method="post" action="/admin/locations/delete/${loc.locationId}" style="display:inline">
                                        <button class="btn-delete" onclick="return confirm('Xóa địa điểm này?')">
                                            🗑️ Xóa
                                        </button>
                                    </form>

                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                </table>
            </div>
        </div>
    </section>

    <div id="locationModal" class="modal">
        <div class="modal-content">
            <span class="close" id="btnCloseModal">&times;</span>
            <h2 id="modalTitle">Thêm địa điểm mới</h2>
            <form id="locationForm" method="post">
                <input type="hidden" name="locationId" id="locationId">

                <label for="name">Tên địa điểm</label>
                <input name="name" id="name" required>
                <label for="description">Mô tả</label>
                <textarea name="description" id="description"></textarea>
                <label for="address">Địa chỉ</label>
                <input name="address" id="address">
                <label for="province">Tỉnh</label>
                <input name="province" id="province">

                <label for="type">Loại</label>
                <select name="type" id="type">
                    <c:forEach var="t" items="${types}">
                        <option value="${t}">${t}</option>
                    </c:forEach>
                </select>

                <label for="historicalPeriod">Thời đại</label>
                <input name="historicalPeriod" id="historicalPeriod">
                <label for="latitude">Kinh độ</label>
                <input name="latitude" id="latitude">
                <label for="longitude">Vĩ độ</label>
                <input name="longitude" id="longitude">
                <label for="mainImageUrl">Hình ảnh</label>
                <input name="mainImageUrl" id="mainImageUrl">

                <label for="status">Trạng thái</label>
                <select name="status" id="status">
                    <c:forEach var="s" items="${statuses}">
                        <option value="${s}">${s}</option>
                    </c:forEach>
                </select>

                <button type="submit">💾 Lưu</button>
            </form>
        </div>
    </div>

    <script src="/scripts/admin/location.js"></script>
    <script src="/scripts/admin/script.js"></script>
</body>
</html>