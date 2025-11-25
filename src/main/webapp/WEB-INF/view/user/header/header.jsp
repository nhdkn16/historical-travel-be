<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <div>
        <nav class="nav">
            <ul class="menu">
                <li><a href="#">Trang chủ</a></li>
                <li><a href="./src/service/socialNetwork/social.html">Cộng đồng</a></li>
                <li><a href="./src/service/location/service.html">Dịch vụ</a></li>
                <li><a href="./src/service/contact/contact.html">Liên hệ</a></li>
                <li id="adminMenuItem" style="display: none;">
                    <a href="./src/Admin/admin.html">Thống kê</a>
                </li>
                <li>
                    <a href="./src/Register/login.html" role="button" aria-pressed="true">Đăng nhập</a>
                    <a href="./src/Register/login.html" role="button" aria-pressed="true">Đăng ký</a>
                </li>
            </ul>
        </nav>
    </div>
</header>
