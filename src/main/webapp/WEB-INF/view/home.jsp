<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Trang chủ</title>
        <link rel="stylesheet" href="/stylesheets/home/style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    </head>
    <body>
        <div class="background"></div>
        <video autoplay muted loop id="bg-video">
            <source src="/assets/videos/background.mp4" type="video/mp4">
            Trình duyệt của bạn không hỗ trợ video nền.
        </video>
        <jsp:include page="user/header/header.jsp" />
        <div class="container">
            <div id="slide">
                <c:forEach var="loc" items="${locations}">
                    <div class="item" style="background-image: url(${loc.mainImageUrl});">
                        <div class="content">
                            <div class="name">${loc.name}</div>
                            <div class="des">${loc.description}</div>
                            <a href="/location/detail/${loc.locationId}">See more</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="buttons">
                <button id="prev"><i class="fa-solid fa-angle-left"></i></button>
                <button id="next"><i class="fa-solid fa-angle-right"></i></button>
            </div>
        </div>

        <script src="/scripts/script.js"></script>
    </body>
    <script src="/scripts/auth/auth.js"></script>
</html>
