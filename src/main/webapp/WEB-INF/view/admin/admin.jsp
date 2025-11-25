<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Di tích Việt Nam</title>
    <link rel="stylesheet" href="/stylesheets/admin/admin.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.0/dist/chart.umd.min.js"></script>
</head>
<body>
    <jsp:include page="/WEB-INF/view/admin/header/header.jsp" />

    <!-- Admin Dashboard Section -->
    <section class="admin-section">
        <div class="container">
            <div class="dashboard-header">
                <h1>📊 Thống kê hoạt động quản trị</h1>
                <p class="dashboard-subtitle">Tổng quan các chức năng quản lý hệ thống du lịch</p>
                <p style="color: #666; margin-top: 10px;">Xin chào, <strong id="adminName">Admin</strong></p>
            </div>

            <!-- Summary Cards -->
            <div class="stats-cards">
                <div class="stat-card">
                    <div class="stat-icon">👥</div>
                    <div class="stat-info">
                        <h3 id="totalUsers">0</h3>
                        <p>Tổng người dùng</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">📝</div>
                    <div class="stat-info">
                        <h3 id="totalPosts">0</h3>
                        <p>Bài viết</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">📍</div>
                    <div class="stat-info">
                        <h3 id="totalLocations">0</h3>
                        <p>Địa điểm</p>
                    </div>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">💬</div>
                    <div class="stat-info">
                        <h3 id="totalComments">0</h3>
                        <p>Bình luận</p>
                    </div>
                </div>
            </div>

            <!-- Chart Section -->
            <div class="chart-container">
                <h2>Biểu đồ thống kê hoạt động hệ thống</h2>
                <canvas id="activityChart"></canvas>
            </div>

            <!-- Data Table -->
            <div class="data-table-container">
                <h2>Chi tiết thống kê chức năng</h2>
                <table class="data-table" id="statsTable">
                    <thead>
                        <tr>
                            <th>STT</th>
                            <th>Chức năng</th>
                            <th>Số lượng</th>
                            <th>Trạng thái</th>
                        </tr>
                    </thead>
                    <tbody></tbody>
                </table>
            </div>
        </div>
    </section>

    <script src="/scripts/admin/script.js"></script>
    <script>
        // Kiểm tra đăng nhập
        if (localStorage.getItem('isAdminLoggedIn') !== 'true') {
            alert('⛔ Bạn cần đăng nhập để truy cập trang này!');
            window.location.href = '/login';
        }

        // Hiển thị tên admin
        const adminUsername = localStorage.getItem('adminUsername') || 'Admin';
        document.getElementById('adminName').textContent = adminUsername;

        // Khởi tạo dữ liệu mẫu nếu chưa có
        function initSampleData() {
            if (!localStorage.getItem('adminData')) {
                const sampleData = {
                    users: [
                        { id: 1, username: 'nguyen_van_a', email: 'nva@gmail.com', role: 'user', status: 'active', fullname: 'Nguyễn Văn A', createdAt: '2025-01-05' },
                        { id: 2, username: 'tran_thi_b', email: 'ttb@gmail.com', role: 'user', status: 'active', fullname: 'Trần Thị B', createdAt: '2025-01-08' },
                        { id: 3, username: 'le_van_c', email: 'lvc@gmail.com', role: 'admin', status: 'active', fullname: 'Lê Văn C', createdAt: '2025-01-10' },
                        { id: 4, username: 'pham_thi_d', email: 'ptd@gmail.com', role: 'user', status: 'blocked', fullname: 'Phạm Thị D', createdAt: '2025-01-12' }
                    ],
                    locations: [
                        { id: 1, name: 'Chùa Một Cột', city: 'Hà Nội', description: 'Di tích lịch sử nổi tiếng, biểu tượng của Thủ đô Hà Nội', lat: 21.0352, lng: 105.8345, status: 'active', image: 'https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=500' },
                        { id: 2, name: 'Phố cổ Hội An', city: 'Quảng Nam', description: 'Di sản văn hóa thế giới, phố cổ đẹp nhất Việt Nam', lat: 15.8801, lng: 108.3380, status: 'active', image: 'https://images.unsplash.com/photo-1559592413-7cec4d0cae2b?w=500' },
                        { id: 3, name: 'Vịnh Hạ Long', city: 'Quảng Ninh', description: 'Kỳ quan thiên nhiên thế giới với hàng nghìn đảo đá', lat: 20.9101, lng: 107.1839, status: 'active', image: 'https://images.unsplash.com/photo-1528127269322-539801943592?w=500' },
                        { id: 4, name: 'Hoàng Thành Huế', city: 'Thừa Thiên Huế', description: 'Di sản văn hóa thế giới, cố đô của Việt Nam', lat: 16.4637, lng: 107.5909, status: 'active', image: 'https://images.unsplash.com/photo-1583417319070-4a69db38a482?w=500' }
                    ],
                    posts: [
                        { id: 1, title: 'Khám phá Hội An cổ kính', summary: 'Hành trình khám phá phố cổ đẹp nhất Việt Nam', content: 'Hội An là một trong những điểm đến hấp dẫn nhất Việt Nam với kiến trúc cổ kính, đèn lồng rực rỡ và ẩm thực đặc sắc...', author: 'Admin', date: '2025-01-10', status: 'published', category: 'du-lich', image: 'https://images.unsplash.com/photo-1559592413-7cec4d0cae2b?w=500' },
                        { id: 2, title: 'Vịnh Hạ Long đẹp mê hồn', summary: 'Vẻ đẹp tuyệt vời của di sản thiên nhiên', content: 'Vịnh Hạ Long với hàng nghìn hòn đảo đá vôi được UNESCO công nhận là di sản thiên nhiên thế giới...', author: 'Admin', date: '2025-01-12', status: 'published', category: 'di-tich', image: 'https://images.unsplash.com/photo-1528127269322-539801943592?w=500' },
                        { id: 3, title: 'Lịch sử Chùa Một Cột', summary: 'Tìm hiểu về di tích lịch sử nghìn năm tuổi', content: 'Chùa Một Cột được xây dựng từ thời Lý Thái Tông năm 1049, là biểu tượng văn hóa của Thủ đô Hà Nội...', author: 'Admin', date: '2025-01-15', status: 'draft', category: 'van-hoa', image: '' }
                    ],
                    comments: [
                        { id: 1, user: 'nguyen_van_a', content: 'Địa điểm rất đẹp, tôi sẽ quay lại! Kiến trúc cổ kính và không gian yên tĩnh.', target: 'Chùa Một Cột', targetType: 'location', rating: 5, date: '2025-11-10', status: 'approved' },
                        { id: 2, user: 'tran_thi_b', content: 'Cần cải thiện thêm về vệ sinh khu vực xung quanh. Nhưng nhìn chung vẫn rất đẹp.', target: 'Phố cổ Hội An', targetType: 'location', rating: 3, date: '2025-11-11', status: 'approved' },
                        { id: 3, user: 'le_van_c', content: 'Bài viết rất hữu ích, cảm ơn admin! Thông tin chi tiết và hình ảnh đẹp.', target: 'Khám phá Hội An', targetType: 'post', rating: 5, date: '2025-11-12', status: 'approved' },
                        { id: 4, user: 'pham_thi_d', content: 'Spam content here... Click link to get free...', target: 'Vịnh Hạ Long', targetType: 'post', rating: 1, date: '2025-11-12', status: 'pending' },
                        { id: 5, user: 'nguyen_van_a', content: 'Tuyệt vời! Rất đáng để ghé thăm. Phong cảnh hùng vĩ!', target: 'Vịnh Hạ Long', targetType: 'location', rating: 5, date: '2025-11-13', status: 'approved' }
                    ]
                };
                localStorage.setItem('adminData', JSON.stringify(sampleData));
            }
        }

        initSampleData();

        // Lấy dữ liệu từ localStorage
        const adminData = JSON.parse(localStorage.getItem('adminData'));

        // Cập nhật số liệu thống kê
        document.getElementById('totalUsers').textContent = adminData.users.length;
        document.getElementById('totalPosts').textContent = adminData.posts.length;
        document.getElementById('totalLocations').textContent = adminData.locations.length;
        document.getElementById('totalComments').textContent = adminData.comments.length;

        // Dữ liệu cho biểu đồ
        const statsData = [
            { name: 'Người dùng', value: adminData.users.length, color: '#FF6384' },
            { name: 'Địa điểm', value: adminData.locations.length, color: '#36A2EB' },
            { name: 'Bài viết', value: adminData.posts.length, color: '#FFCE56' },
            { name: 'Bình luận', value: adminData.comments.length, color: '#4BC0C0' },
            { name: 'Lượt truy cập', value: Math.floor(Math.random() * 100) + 50, color: '#9966FF' },
            { name: 'Lượt xem', value: Math.floor(Math.random() * 500) + 200, color: '#FF9F40' }
        ];

        // Tạo biểu đồ
        const ctx = document.getElementById('activityChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: statsData.map(item => item.name),
                datasets: [{
                    label: 'Thống kê',
                    data: statsData.map(item => item.value),
                    backgroundColor: statsData.map(item => item.color),
                    borderColor: statsData.map(item => item.color),
                    borderWidth: 2
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: { display: true, position: 'top' },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                return context.dataset.label + ': ' + context.parsed.y;
                            }
                        }
                    }
                },
                scales: {
                    y: { 
                        beginAtZero: true, 
                        ticks: { stepSize: 20 }
                    }
                }
            }
        });

        // Điền dữ liệu vào bảng
        const tableBody = document.querySelector('#statsTable tbody');
        statsData.forEach((item, index) => {
            const row = tableBody.insertRow();
            row.innerHTML = `
                <td>${index + 1}</td>
                <td>${item.name}</td>
                <td><strong>${item.value}</strong></td>
                <td><span class="status-badge ${item.value > 10 ? 'status-active' : 'status-normal'}">
                    ${item.value > 10 ? '✅ Hoạt động tốt' : '⚠️ Bình thường'}
                </span></td>
            `;
        });

        // Xử lý đăng xuất
        document.getElementById('logoutBtn').addEventListener('click', function(e) {
            e.preventDefault();
            if (confirm('Bạn có chắc muốn đăng xuất?')) {
                localStorage.removeItem('isAdminLoggedIn');
                localStorage.removeItem('adminUsername');
                alert('✅ Đăng xuất thành công!');
                window.location.href = '/';
            }
        });
    </script>
</body>
</html>
