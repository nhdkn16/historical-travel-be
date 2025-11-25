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
    <style>
        .action-buttons { display: flex; gap: 8px; flex-wrap: wrap; }
        .btn-edit, .btn-delete { padding: 6px 12px; border: none; border-radius: 5px; cursor: pointer; font-size: 0.85rem; font-weight: 500; transition: all 0.3s; }
        .btn-edit { background-color: #4CAF50; color: white; }
        .btn-delete { background-color: #f44336; color: white; }
        .btn-edit:hover { background-color: #45a049; transform: translateY(-2px); }
        .btn-delete:hover { background-color: #da190b; transform: translateY(-2px); }
        .btn-add { background-color: #1e3c72; color: white; padding: 12px 24px; border: none; border-radius: 5px; cursor: pointer; margin-bottom: 20px; font-size: 1rem; font-weight: 600; transition: all 0.3s; }
        .btn-add:hover { background-color: #2a5298; transform: translateY(-2px); box-shadow: 0 4px 12px rgba(30,60,114,0.3); }
        .modal { display: none; position: fixed; z-index: 2000; left: 0; top: 0; width: 100%; height: 100%; background-color: rgba(0,0,0,0.6); overflow-y: auto; padding: 20px 0; }
        .modal-content { background-color: white; margin: 3% auto; padding: 30px; border-radius: 12px; width: 90%; max-width: 650px; box-shadow: 0 10px 40px rgba(0,0,0,0.3); animation: slideDown 0.3s; }
        @keyframes slideDown { from { opacity: 0; transform: translateY(-50px); } to { opacity: 1; transform: translateY(0); } }
        .close { color: #aaa; float: right; font-size: 28px; font-weight: bold; cursor: pointer; line-height: 20px; transition: color 0.3s; }
        .close:hover { color: #000; }
        .form-group { margin-bottom: 18px; }
        .form-group label { display: block; margin-bottom: 8px; font-weight: 600; color: #333; }
        .form-group input, .form-group select, .form-group textarea { width: 100%; padding: 10px; border: 2px solid #e0e0e0; border-radius: 6px; font-size: 1rem; font-family: inherit; transition: border-color 0.3s; }
        .form-group input:focus, .form-group textarea:focus, .form-group select:focus { outline: none; border-color: #1e3c72; }
        .form-group textarea { min-height: 80px; resize: vertical; }
        .btn-submit { background-color: #4CAF50; color: white; padding: 12px 24px; border: none; border-radius: 6px; cursor: pointer; font-size: 1rem; font-weight: 600; width: 100%; transition: all 0.3s; }
        .btn-submit:hover { background-color: #45a049; transform: translateY(-2px); }
        .image-preview { max-width: 100%; max-height: 200px; margin-top: 10px; border-radius: 8px; display: none; border: 2px solid #e0e0e0; }
        .search-box { margin-bottom: 20px; }
        .search-box input { padding: 10px 15px; width: 100%; max-width: 400px; border: 2px solid #e0e0e0; border-radius: 6px; font-size: 1rem; }
        .coordinate-group { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/view/admin/header/header.jsp" />

    <section class="admin-section">
        <div class="container">
            <div class="dashboard-header">
                <h1>📍 Quản lý địa điểm du lịch</h1>
                <p class="dashboard-subtitle">Thêm, sửa, xóa các địa điểm du lịch và di tích lịch sử</p>
            </div>

            <button class="btn-add" onclick="openModal()">➕ Thêm địa điểm mới</button>

            <div class="search-box">
                <input type="text" id="searchInput" placeholder="🔍 Tìm kiếm địa điểm..." onkeyup="searchLocations()">
            </div>

            <div class="data-table-container">
                <h2>Danh sách địa điểm (<span id="locationCount">0</span>)</h2>
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
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </section>

    <!-- Modal Form -->
    <div id="locationModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>
            <h2 id="modalTitle">Thêm địa điểm mới</h2>
            <form id="locationForm">
                <input type="hidden" id="locationId">
                
                <div class="form-group">
                    <label>Tên địa điểm *</label>
                    <input type="text" id="locationName" required placeholder="VD: Chùa Một Cột">
                </div>

                <div class="form-group">
                    <label>Thành phố *</label>
                    <input type="text" id="locationCity" required placeholder="VD: Hà Nội">
                </div>

                <div class="form-group">
                    <label>Mô tả</label>
                    <textarea id="locationDescription" placeholder="Mô tả chi tiết về địa điểm..."></textarea>
                </div>

                <div class="coordinate-group">
                    <div class="form-group">
                        <label>Vĩ độ (Latitude) *</label>
                        <input type="number" step="0.0001" id="locationLat" required placeholder="21.0352">
                    </div>

                    <div class="form-group">
                        <label>Kinh độ (Longitude) *</label>
                        <input type="number" step="0.0001" id="locationLng" required placeholder="105.8345">
                    </div>
                </div>

                <div class="form-group">
                    <label>Hình ảnh (URL)</label>
                    <input type="url" id="locationImage" onchange="previewImage()" placeholder="https://...">
                    <img id="imagePreview" class="image-preview">
                </div>

                <div class="form-group">
                    <label>Trạng thái</label>
                    <select id="locationStatus">
                        <option value="active">Hoạt động</option>
                        <option value="inactive">Tạm ẩn</option>
                    </select>
                </div>

                <button type="submit" class="btn-submit">💾 Lưu địa điểm</button>
            </form>
        </div>
    </div>

    <script src="/scripts/admin/script.js"></script>
    <script src="/scripts/admin/location.js"></script>
</body>
</html>