<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" href="/stylesheets/home/featured.css">

<section class="featured">
    <h2>Địa điểm nổi bật</h2>

    <div class="featured-grid">
        <c:forEach var="loc" items="${featuredLocations}">
            <div class="location-card">
                <img src="${loc.mainImageUrl}" alt="${loc.name}">
                <div class="info">
                    <h3>${loc.name}</h3>
                    <p>${loc.province}</p>
                    <a href="/location/detail/${loc.locationId}">
                        Xem chi tiết
                    </a>
                </div>
            </div>
        </c:forEach>
    </div>
</section>
