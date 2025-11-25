// Kiểm tra trạng thái đăng nhập khi load trang
document.addEventListener('DOMContentLoaded', function() {
    updateNavigation();
});

    // Cập nhật navigation bar dựa trên trạng thái đăng nhập
function updateNavigation() {
    const nav = document.querySelector('.nav-menu') || document.querySelector('.menu');
    const loginButtons = nav?.querySelectorAll('a[href*="login"]');
    
    if (!Auth.isLoggedIn()) {
        // Chưa đăng nhập - giữ nguyên
        return;
    }
    
    // Đã đăng nhập
    const user = Auth.getCurrentUser();
    
    // Nếu là ADMIN - thêm menu Thống kê
    if (user.isAdmin) {
        // Xóa menu cũ nếu có
        const oldAdminMenu = document.getElementById('adminStatsMenu');
        if (oldAdminMenu) oldAdminMenu.remove();
        
        // Tạo menu Thống kê
        const statsLi = document.createElement('li');
        statsLi.id = 'adminStatsMenu';
        statsLi.innerHTML = '<a href="./src/Admin/admin.html" style="color: #ff7043; font-weight: bold;">📊 Thống kê</a>';
        
        // Thêm vào menu (trước nút đăng nhập/đăng ký)
        if (nav) {
            const lastLi = nav.querySelector('li:last-child');
            if (lastLi) {
                nav.insertBefore(statsLi, lastLi);
            } else {
                nav.appendChild(statsLi);
            }
        }
        
        console.log('✅ Đã thêm menu Thống kê cho Admin');
    }
    
    // Cập nhật nút đăng nhập/đăng ký thành nút đăng xuất
    if (loginButtons && loginButtons.length > 0) {
        loginButtons.forEach(btn => {
            const parentLi = btn.parentElement;
            if (parentLi) {
                // Xóa tất cả các nút đăng nhập/đăng ký trong li
                parentLi.innerHTML = '';
                
                // Tạo nút đăng xuất
                const logoutBtn = document.createElement('a');
                logoutBtn.href = '#';
                logoutBtn.textContent = user.isAdmin 
                    ? `👤 ${user.username} (Admin)` 
                    : `👤 ${user.username}`;
                logoutBtn.style.color = user.isAdmin ? '#ff7043' : 'inherit';
                logoutBtn.style.fontWeight = user.isAdmin ? 'bold' : 'normal';
                
                logoutBtn.onclick = function(e) {
                    e.preventDefault();
                    if (confirm('Bạn có chắc muốn đăng xuất?')) {
                        Auth.logout();
                        alert('Đăng xuất thành công!');
                        window.location.reload();
                    }
                };
                
                parentLi.appendChild(logoutBtn);
            }
        });
    }
}

// Kiểm tra và cập nhật khi người dùng quay lại trang
window.addEventListener('focus', function() {
    updateNavigation();
});
    
// Kiểm tra định kỳ (mỗi 5 giây) - đề phòng thay đổi trạng thái
setInterval(function() {
    const currentStatus = Auth.isLoggedIn();
    const adminStatus = Auth.isAdmin();
    const adminMenu = document.getElementById('adminStatsMenu');
    
    // Nếu không phải admin nhưng menu admin vẫn hiển thị
    if (!adminStatus && adminMenu) {
        adminMenu.remove();
    }
    
    // Nếu là admin nhưng chưa có menu
    if (adminStatus && !adminMenu) {
        updateNavigation();
    }
}, 5000);

document.getElementById('next').onclick = function(){
    let lists = document.querySelectorAll('.item');
    document.getElementById('slide').appendChild(lists[0]);
}

document.getElementById('prev').onclick = function(){
    let lists = document.querySelectorAll('.item');
    document.getElementById('slide').prepend(lists[lists.length - 1]);
}
