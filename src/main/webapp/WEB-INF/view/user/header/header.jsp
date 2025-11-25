<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header>
    <div>
        <nav class="nav">
            <ul class="menu">
                <li><a href="/">Trang chủ</a></li>
                <li><a href="/social">Cộng đồng</a></li>
                <li><a href="/service">Dịch vụ</a></li>
                <li><a href="/contact">Liên hệ</a></li>
                <li id="adminMenuItem" style="display: none;">
                    <a href="/admin">Thống kê</a>
                </li>
                <li>
                    <a href="/login" role="button" aria-pressed="true">Đăng nhập</a>
                    <a href="/register" role="button" aria-pressed="true">Đăng ký</a>
                </li>
            </ul>
        </nav>
    </div>
</header>
