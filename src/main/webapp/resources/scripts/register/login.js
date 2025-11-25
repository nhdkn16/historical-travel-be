// ===== XỬ LÝ ĐĂNG NHẬP =====

// Kiểm tra nếu đã đăng nhập thì chuyển về trang chủ
if (Auth.isLoggedIn()) {
  const user = Auth.getCurrentUser();
  if (user.isAdmin) {
    window.location.href = '/admin';
  } else {
    window.location.href = '/';
  }
}

// Xử lý đăng nhập
function handleLogin() {
  const username = document.getElementById('username').value.trim();
  const password = document.getElementById('password').value.trim();

  if (!username || !password) {
    alert('Vui lòng nhập đầy đủ thông tin!');
    return;
  }

  const result = Auth.login(username, password);
  
  if (result.success) {
    // Kiểm tra role để chuyển hướng
    if (result.role === 'admin') {
      alert('🎉 Đăng nhập thành công với quyền Admin!');
      
      // Chuyển đến trang admin
      setTimeout(() => {
        window.location.href = '/admin';
      }, 500);
    } else {
      alert('✅ Đăng nhập thành công!');
      
      // Lấy URL để quay lại (nếu có)
      const returnUrl = new URLSearchParams(window.location.search).get('return') || '/';
      window.location.href = returnUrl;
    }
  } else {
    alert('❌ Sai tên đăng nhập hoặc mật khẩu!');
    document.getElementById('password').value = '';
    document.getElementById('username').focus();
  }
}

// Xử lý khi nhấn Enter ở ô password
document.getElementById('password').addEventListener('keypress', function(e) {
  if (e.key === 'Enter') {
    handleLogin();
  }
});

// Auto focus vào ô username
document.getElementById('username').focus();

// Hiển thị thông tin đăng nhập admin
// const wrapper = document.querySelector('.wrapper');
// if (wrapper) {
//   const infoDiv = document.createElement('div');
//   infoDiv.style.cssText = `
//     background: rgba(255, 255, 255, 0.95);
//     padding: 15px;
//     border-radius: 10px;
//     margin-top: 20px;
//     text-align: center;
//     backdrop-filter: blur(10px);
//     border: 2px solid rgba(255, 255, 255, 0.3);
//   `;
//   infoDiv.innerHTML = `
//     <p style="margin: 5px 0; color: #333; font-size: 0.9rem;">
//       <strong>ℹ️ Tài khoản Admin:</strong><br>
//       Username: <code style="background: #f0f0f0; padding: 2px 6px; border-radius: 3px;">admin</code><br>
//       Password: <code style="background: #f0f0f0; padding: 2px 6px; border-radius: 3px;">admin123</code>
//     </p>
//   `;
//   wrapper.appendChild(infoDiv);
// }