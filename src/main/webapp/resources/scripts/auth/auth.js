// ===== HỆ THỐNG XÁC THỰC =====

const Auth = {
  // Tài khoản admin mặc định (tạo sẵn)
  ADMIN_ACCOUNT: {
    username: 'admin',
    email: 'admin@example.com',
    password: 'admin123',
    role: 'admin'
  },

  // Khởi tạo
  init() {
    this.loadRegisteredUsers();
    this.createDefaultAdmin();
  },

  // Tạo tài khoản admin mặc định nếu chưa có
  createDefaultAdmin() {
    let users = JSON.parse(localStorage.getItem('registeredUsers') || '{}');
    
    // Nếu chưa có admin, tạo tài khoản admin
    if (!users[this.ADMIN_ACCOUNT.username]) {
      users[this.ADMIN_ACCOUNT.username] = {
        email: this.ADMIN_ACCOUNT.email,
        password: this.ADMIN_ACCOUNT.password,
        role: 'admin',
        createdAt: new Date().toISOString()
      };
      localStorage.setItem('registeredUsers', JSON.stringify(users));
      console.log('✅ Đã tạo tài khoản admin mặc định');
    }
  },

  // Load users đã đăng ký từ localStorage
  loadRegisteredUsers() {
    const users = localStorage.getItem('registeredUsers');
    if (!users) {
      localStorage.setItem('registeredUsers', JSON.stringify({}));
    }
  },

  // Đăng ký user mới
  register(username, email, password, role = 'user') {
    let users = JSON.parse(localStorage.getItem('registeredUsers') || '{}');
    
    // Kiểm tra username đã tồn tại
    if (users[username]) {
      return { success: false, message: 'Tên đăng nhập đã tồn tại!' };
    }
    
    // Không cho đăng ký username "admin"
    if (username.toLowerCase() === 'admin') {
      return { success: false, message: 'Tên đăng nhập này không được phép sử dụng!' };
    }
    
    // Lưu user mới
    users[username] = {
      email: email,
      password: password,
      role: role,
      createdAt: new Date().toISOString()
    };
    
    localStorage.setItem('registeredUsers', JSON.stringify(users));
    
    return { success: true, message: 'Đăng ký thành công!' };
  },

  // Đăng nhập (cả user và admin)
  login(username, password) {
    const users = JSON.parse(localStorage.getItem('registeredUsers') || '{}');
    const user = users[username];
    
    if (user && user.password === password) {
      // Lưu session
      localStorage.setItem('isLoggedIn', 'true');
      localStorage.setItem('currentUser', username);
      localStorage.setItem('userRole', user.role);
      localStorage.setItem('loginTime', new Date().toISOString());
      
      // Nếu là admin, lưu thêm flag admin
      if (user.role === 'admin') {
        localStorage.setItem('isAdminLoggedIn', 'true');
        localStorage.setItem('adminUsername', username);
      }
      
      return { success: true, role: user.role };
    }
    
    return { success: false, role: null };
  },

  // Kiểm tra đã đăng nhập
  isLoggedIn() {
    return localStorage.getItem('isLoggedIn') === 'true';
  },

  // Kiểm tra có phải admin không
  isAdmin() {
    return this.isLoggedIn() && localStorage.getItem('userRole') === 'admin';
  },

  // Lấy thông tin user hiện tại
  getCurrentUser() {
    if (!this.isLoggedIn()) return null;
    
    return {
      username: localStorage.getItem('currentUser'),
      role: localStorage.getItem('userRole'),
      isAdmin: this.isAdmin()
    };
  },

  // Đăng xuất
  logout() {
    localStorage.removeItem('isLoggedIn');
    localStorage.removeItem('currentUser');
    localStorage.removeItem('userRole');
    localStorage.removeItem('loginTime');
    localStorage.removeItem('isAdminLoggedIn');
    localStorage.removeItem('adminUsername');
  },

  // Yêu cầu đăng nhập
  requireLogin(redirectUrl = '/login') {
    if (!this.isLoggedIn()) {
      const currentPath = window.location.pathname;
      window.location.href = redirectUrl + '?return=' + encodeURIComponent(currentPath);
      return false;
    }
    return true;
  },

  // Yêu cầu quyền admin
  requireAdmin() {
    if (!this.isLoggedIn()) {
      alert('⛔ Bạn cần đăng nhập để truy cập trang này!');
      window.location.href = '/login';
      return false;
    }
    
    if (!this.isAdmin()) {
      alert('⛔ Bạn không có quyền truy cập trang này! Chỉ dành cho Admin.');
      window.location.href = '/';
      return false;
    }
    
    return true;
  },

  // Lấy danh sách tất cả users (chỉ admin)
  getAllUsers() {
    if (!this.isAdmin()) return null;
    return JSON.parse(localStorage.getItem('registeredUsers') || '{}');
  }
};

// Khởi tạo khi load
Auth.init();
