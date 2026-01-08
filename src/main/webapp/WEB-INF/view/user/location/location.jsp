<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Địa điểm - TravelVN</title>
    <link rel="stylesheet" href="/stylesheets/location/location.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
</head>
<body>
    <jsp:include page="/WEB-INF/view/user/header/main-header.jsp" />

    <section class="location-page">
        <h1>Khám phá các địa danh lịch sử</h1>

        <form class="location-search" action="/location" method="get">
            <div class="search-box">
                <input type="text"
                    name="keyword"
                    placeholder="🔍 Tìm theo tên địa điểm, tỉnh thành..."
                    value="${param.keyword}">
                <button type="submit">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </form>

        <div class="location-grid" id="location-grid">
            <c:forEach items="${locations}" var="loc">
                <div class="location-card">
                    <img src="${loc.mainImageUrl}" alt="${loc.name}">
                    <h3>${loc.name}</h3>
                    <p>${loc.province}</p>
                    <span>${loc.type}</span>
                    <a href="/location/detail/${loc.locationId}">
                        Xem chi tiết
                    </a>
                </div>
            </c:forEach>
        </div>
        <c:if test="${totalPages > 1}">
            <div class="pagination">
                <c:if test="${currentPage > 0}">
                    <a href="/location?page=${currentPage - 1}&keyword=${param.keyword}">‹</a>
                </c:if>

                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <a href="/location?page=${i}&keyword=${param.keyword}"
                       class="${i == currentPage ? 'active' : ''}" data-page="${i}">
                        ${i + 1}
                    </a>
                </c:forEach>

                <c:if test="${currentPage < totalPages - 1}">
                    <a href="/location?page=${currentPage + 1}&keyword=${param.keyword}">›</a>
                </c:if>
            </div>
        </c:if>
    </section>

    <script>
        window.addEventListener("load", function () {
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.has("page")) {
                const section = document.getElementById("location-grid");
                if (section) {
                    section.scrollIntoView({
                        behavior: "smooth",
                        block: "start"
                    });
                }
            }
        });
    </script>
</body>
</html>
