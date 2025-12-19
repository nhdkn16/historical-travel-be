<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link rel="stylesheet" href="/stylesheets/header.css">

<c:set var="isHome" value="${pageContext.request.requestURI == '/'}" />

<div class="header ${isHome ? 'header-home' : ''}">
    <div class="containers">
        <div class="logo"><a href="/">🌍 HistoricalTravel</a></div>
        <nav class="nav">
            <ul>
                <li><a href="/">Trang chủ</a></li>
                <li><a href="/social">Cộng đồng</a></li>
                <li><a href="/service">Dịch vụ</a></li>
                <li><a href="/contact">Liên hệ</a></li>

                <sec:authorize access="hasRole('ADMIN')">
                    <li><a href="/admin">📊 Quản trị</a></li>
                </sec:authorize>

                <c:choose>
                    <c:when test="${empty loggedInUser}">
                        <li><a href="/login">Đăng nhập</a></li>
                        <li><a href="/register">Đăng ký</a></li>
                    </c:when>
                    <c:otherwise>
                        <li>
                            Chào, <a href="/profile">${loggedInUser.username}</a>
                            <form action="/logout" method="post" style="display:inline;">
                                <button type="submit">(Đăng xuất)</button>
                            </form>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </div>
</div>
