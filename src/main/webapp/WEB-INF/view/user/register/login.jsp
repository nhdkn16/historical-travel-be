<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="/stylesheets/register/login.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>
<body>

<div class="background"></div>
<video autoplay muted loop id="bg-video">
    <source src="/assets/videos/trongdong.mp4" type="video/mp4">
</video>

<div class="wrapper">
    <form action="/login" method="post">
        <h1>Login</h1>

        <c:if test="${param.error != null}">
            <p style="color:red;text-align:center">❌ Sai tài khoản hoặc mật khẩu</p>
        </c:if>

        <c:if test="${param.logout != null}">
            <p style="color:green;text-align:center">✅ Đã đăng xuất</p>
        </c:if>

        <div class="input-box">
            <i class='bx bxs-user'></i>
            <input type="text" name="username" placeholder="Username" required>
        </div>

        <div class="input-box">
            <i class='bx bxs-lock-alt'></i>
            <input type="password" name="password" placeholder="Password" required>
        </div>

        <button type="submit" class="btn">Login</button>

        <div class="register-link">
            <p>Don't have an account?
                <a href="/register">Register</a>
            </p>
        </div>
    </form>
</div>

</body>
</html>
