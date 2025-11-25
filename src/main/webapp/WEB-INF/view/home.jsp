<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                <div class="item" style="background-image: url(/assets/images/vn_co_do_Hue.jpg);">
                    <div class="content">
                        <div class="name">Cố đô Huế</div>
                        <div class="des">Cố đô Huế, đi dạo Kinh thành, cẩn thận kẻo lạc vào mộng mơ!</div>
                        <button onclick="window.location.href='src/service/location/detail.html?id=hue'">See more</button>
                    </div>
                </div>
                <div class="item" style="background-image: url(/assets/images/di_tich_my_son.jpg);">
                    <div class="content">
                        <div class="name">Di tích Mỹ Sơn (Quảng Nam)</div>
                        <div class="des">Khám phá thánh địa Chăm Pa cổ kính, nơi các tháp gạch đỏ thắm kể chuyện xưa. Cẩn thận nhé, lạc vào mê cung lịch sử là mê luôn đấy!</div>
                        <button onclick="window.location.href='src/service/location/detail.html?id=myson'">See more</button>
                    </div>
                </div>
                <div class="item" style="background-image: url(/assets/images/pho_co_hoi_an.jpg);">
                    <div class="content">
                        <div class="name">Phố cổ Hội An (Quảng Nam)</div>
                        <div class="des">Bước vào phố cổ, nơi thời gian như ngừng trôi với Chùa Cầu và nhà cổ. Chụp ảnh choẹt, ăn cao lầu, rồi ngẩn ngơ với vẻ đẹp cổ kính!</div>
                        <button onclick="window.location.href='src/service/location/detail.html?id=hoian'">See more</button>
                    </div>
                </div>
                <div class="item" style="background-image: url(/assets/images/thanh_co_qt.jpg);">
                    <div class="content">
                        <div class="name">Thành cổ Quảng Trị (Quảng Trị)</div>
                        <div class="des">Nơi ghi dấu trận chiến 81 ngày đêm, đứng đây cảm giác như nghe tiếng vọng anh hùng. Tham quan đi, lịch sử sống động lắm đấy!</div>
                        <button onclick="window.location.href='src/service/location/detail.html?id=quangtri'">See more</button>
                    </div>
                </div>
                <div class="item" style="background-image: url(/assets/images/dia_dao_cu_chi.jpg);">
                    <div class="content">
                        <div class="name">Địa đạo Củ Chi (Bình Định)</div>
                        <div class="des">Địa đạo Củ Chi, biểu tượng kháng chiến, nơi quân dân ta biến lòng đất thành pháo đài bất khuất.</div>
                        <button onclick="window.location.href='src/service/location/detail.html?id=cuchi'">See more</button>
                    </div>
                </div>
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