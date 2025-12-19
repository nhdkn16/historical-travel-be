<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="/stylesheets/admin/admin.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
</head>
<body>

    <jsp:include page="/WEB-INF/view/admin/header/header.jsp"/>

    <section class="admin-section">
        <div class="container">
            <div class="dashboard-header">
                <h1>📊 Thống kê quản trị</h1>
                <p>Xin chào, <strong>${adminName}</strong></p>
            </div>

            <!-- Cards -->
            <div class="stats-cards">
                <div class="stat-card">
                    <h3>${stats.totalUsers}</h3>
                    <p>Người dùng</p>
                </div>
                <div class="stat-card">
                    <h3>${stats.totalLocations}</h3>
                    <p>Địa điểm</p>
                </div>
                <div class="stat-card">
                    <h3>${stats.totalPosts}</h3>
                    <p>Bài viết</p>
                </div>
                <div class="stat-card">
                    <h3>${stats.totalComments}</h3>
                    <p>Bình luận</p>
                </div>
                <div class="stat-card">
                    <h3>${stats.totalBookings}</h3>
                    <p>Booking</p>
                </div>
            </div>

            <div id="dashboardChartData"
                data-labels='${chartLabelsJson}'
                data-values='${chartValuesJson}'>
            </div>

            <!-- Chart -->
            <canvas id="activityChart"></canvas>

            <!-- Table -->
            <table class="data-table">
                <thead>
                <tr>
                    <th>STT</th>
                    <th>Chức năng</th>
                    <th>Số lượng</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="row" items="${stats.tableStats}" varStatus="i">
                    <tr>
                        <td>${i.index + 1}</td>
                        <td>${row.name}</td>
                        <td>${row.value}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </section>

    <script src="/scripts/admin/dashboard-chart.js"></script>

</body>
</html>
