// ===== KIỂM TRA TRẠNG THÁI ĐĂNG NHẬP =====
// Khi trang được load, kiểm tra xem user đã đăng nhập chưa
document.addEventListener('DOMContentLoaded', function() {
    checkLoginStatus();
    initCarousel();
});

// Hàm kiểm tra trạng thái đăng nhập
function checkLoginStatus() {
    const isLoggedIn = localStorage.getItem('isAdminLoggedIn');
    const loginBtn = document.getElementById('loginBtn');
    const adminMenuItem = document.getElementById('adminMenuItem');
    
    if (isLoggedIn === 'true') {
        // Nếu đã đăng nhập với tài khoản admin
        if (loginBtn) {
            loginBtn.textContent = 'Đăng xuất';
            loginBtn.href = '#';
            loginBtn.onclick = function(e) {
                e.preventDefault();
                logout();
            };
        }
        
        // Hiển thị menu "Thống kê"
        if (adminMenuItem) {
            adminMenuItem.style.display = 'block';
        }
    } else {
        // Nếu chưa đăng nhập
        if (loginBtn) {
            loginBtn.textContent = 'Đăng nhập';
            loginBtn.href = '/';
        }
        
        // Ẩn menu "Thống kê"
        if (adminMenuItem) {
            adminMenuItem.style.display = 'none';
        }
    }
}

// Hàm đăng xuất
function logout() {
    if (confirm('Bạn có chắc muốn đăng xuất?')) {
        localStorage.removeItem('isAdminLoggedIn');
        alert('Đăng xuất thành công!');
        window.location.reload();
    }
}

// ===== CAROUSEL CHO GALLERY IMAGES =====
let currentSlide = 0;

function initCarousel() {
    const galleryItems = document.querySelectorAll('.gallery-item');
    if (galleryItems.length > 0) {
        showSlide(currentSlide);
    }
}

function changeSlide(direction) {
    const galleryItems = document.querySelectorAll('.gallery-item');
    
    // Ẩn slide hiện tại
    galleryItems[currentSlide].style.opacity = '0';
    
    // Tính toán slide tiếp theo
    currentSlide += direction;
    
    // Xử lý vòng lặp carousel
    if (currentSlide >= galleryItems.length) {
        currentSlide = 0;
    } else if (currentSlide < 0) {
        currentSlide = galleryItems.length - 1;
    }
    
    // Hiển thị slide mới
    setTimeout(() => {
        showSlide(currentSlide);
    }, 300);
}

function showSlide(index) {
    const galleryItems = document.querySelectorAll('.gallery-item');
    
    // Ẩn tất cả slides
    galleryItems.forEach(item => {
        item.style.display = 'none';
        item.style.opacity = '0';
    });
    
    // Hiển thị slide được chọn
    if (galleryItems[index]) {
        galleryItems[index].style.display = 'block';
        setTimeout(() => {
            galleryItems[index].style.opacity = '1';
        }, 50);
    }
}

// Auto slide carousel (tùy chọn)
function startAutoSlide() {
    setInterval(() => {
        changeSlide(1);
    }, 5000); // Tự động chuyển slide sau 5 giây
}

// startAutoSlide();

// ===== SMOOTH SCROLLING =====
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const href = this.getAttribute('href');
        if (href !== '#' && href.length > 1) {
            e.preventDefault();
            const target = document.querySelector(href);
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        }
    });
});

// ===== ANIMATION ON SCROLL =====
function revealOnScroll() {
    const reveals = document.querySelectorAll('.feature-card');
    
    reveals.forEach(element => {
        const windowHeight = window.innerHeight;
        const elementTop = element.getBoundingClientRect().top;
        const elementVisible = 150;
        
        if (elementTop < windowHeight - elementVisible) {
            element.classList.add('active');
        }
    });
}

window.addEventListener('scroll', revealOnScroll);

// ===== THÔNG BÁO CHÀO MỪNG (TÙY CHỌN) =====
function showWelcomeMessage() {
    const isLoggedIn = localStorage.getItem('isAdminLoggedIn');
    const hasSeenWelcome = sessionStorage.getItem('hasSeenWelcome');
    
    if (isLoggedIn === 'true' && !hasSeenWelcome) {
        setTimeout(() => {
            alert('Chào mừng Admin! Bạn có thể truy cập trang Thống kê từ menu điều hướng.');
            sessionStorage.setItem('hasSeenWelcome', 'true');
        }, 1000);
    }
}

// Hiển thị thông báo chào mừng khi vào trang chủ
if (window.location.pathname.includes('/') || window.location.pathname === '/') {
    showWelcomeMessage();
}