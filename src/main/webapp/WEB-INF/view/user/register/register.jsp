<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Đăng ký tài khoản</title>
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
        <form:form action="/register" method="post" modelAttribute="registerForm" class="register-form">
            <h1>Đăng ký</h1>
        
            <form:errors path="*" element="div" cssClass="error-message error-general" />
                <div class="input-box">
                    <i class='bx bxs-user'></i>
                    <form:input path="username" placeholder="Tên đăng nhập" required="true" />
                </div>
            <form:errors path="username" cssClass="error-message" />

            <div class="input-box">
                <i class='bx bxs-envelope'></i>
                <form:input type="email" path="email" placeholder="Email" required="true" />
            </div>
            <form:errors path="email" cssClass="error-message" />

            <div class="input-box">
                <i class='bx bxs-lock-alt'></i>
                <form:password path="password" placeholder="Mật khẩu" required="true" />
            </div>
            <form:errors path="password" cssClass="error-message" />

            <button type="submit" class="btn">Đăng ký</button>

            <div class="register-link">
                <p>Đã có tài khoản?
                    <a href="/login">Đăng nhập</a>
                </p>
                <p>
                    <a href="/">Về Trang chủ</a>
                </p>
            </div>
        </form:form>
    </div>

    <script>
        document.getElementById('username').focus();
        const errorMessages = document.querySelectorAll('.error-message');
        errorMessages.forEach(msg => {
            msg.style.color = 'red';
            msg.style.fontSize = '0.9em';
            msg.style.marginBottom = '10px';
            msg.style.marginTop = '-10px';
        });
    </script>
</body>
</html>
