<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register</title>
  <link rel="stylesheet" href="/stylesheets/register/login.css" />
  <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>
  <div class="background"></div>
  <video autoplay muted loop id="bg-video">
    <source src="/assets/videos/trongdong.mp4" type="video/mp4" />
    Trình duyệt của bạn không hỗ trợ video nền.
  </video>

  <div class="wrapper">
    <form action="javascript:void(0)" onsubmit="register(); return false;">
      <h1>Register</h1>

      <div class="input-box">
        <input type="text" id="newUser" placeholder="Username" required />
        <i class='bx bxs-user'></i>
      </div>

      <div class="input-box">
        <input type="email" id="newEmail" placeholder="Gmail" required />
        <i class='bx bxs-envelope'></i>
      </div>

      <div class="input-box">
        <input type="password" id="newPass" placeholder="Password" required />
        <i class='bx bxs-lock-alt'></i>
      </div>

      <button type="submit" class="btn">Register</button>

      <div class="register-link">
        <p>Already have an account?
          <a href="/login">Login</a>
        </p>
      </div>
    </form>
  </div>

  <script src="/scripts/auth/auth.js"></script>
  <script>
    function register() {
      const newUser = document.getElementById('newUser').value.trim();
      const newEmail = document.getElementById('newEmail').value.trim();
      const newPass = document.getElementById('newPass').value.trim();

      if (!newUser || !newEmail || !newPass) {
        alert('Vui lòng nhập đầy đủ thông tin!');
        return;
      }

      // Kiểm tra email hợp lệ
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      if (!emailRegex.test(newEmail)) {
        alert('Email không hợp lệ!');
        return;
      }

      // Kiểm tra password (tối thiểu 6 ký tự)
      if (newPass.length < 6) {
        alert('Mật khẩu phải có ít nhất 6 ký tự!');
        return;
      }

      const result = Auth.register(newUser, newEmail, newPass);
      
      if (result.success) {
        alert(result.message + ' Chuyển sang đăng nhập.');
        window.location.href = '/login';
      } else {
        alert(result.message);
      }
    }

    // Auto focus
    document.getElementById('newUser').focus();
  </script>
</body>
</html>