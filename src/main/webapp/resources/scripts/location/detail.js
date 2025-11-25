// ===== DATABASE CÁC ĐỊA ĐIỂM =====

const toursData = {
    'hue': {
        id: 'hue',
        name: "Cố đô Huế",
        subtitle: "Kinh đô xưa - Nơi lịch sử còn vẹn nguyên",
        location: "Thừa Thiên Huế",
        description: `
            <p>Cố đô Huế - Kinh đô của triều đại nhà Nguyễn, nơi lưu giữ những dấu ấn văn hóa cung đình độc đáo và kiến trúc hoàng gia nguy nga.</p>
            <p>Đến với Huế, bạn sẽ được trải nghiệm không khí thanh bình bên dòng sông Hương thơ mộng, khám phá hệ thống lăng tẩm, đền đài cổ kính và thưởng thức nền ẩm thực cung đình tinh tế.</p>
        `,
        duration: "4 ngày 3 đêm",
        price: "6.999.000đ",
        image: "/assets/images/vn_co_do_Hue.jpg",
        badge: "HOT",
        highlights: [
            "Tham quan Đại Nội - Kinh thành Huế (Di sản UNESCO)",
            "Viếng lăng Tự Đức, lăng Khải Định, lăng Minh Mạng",
            "Thưởng thức ẩm thực cung đình Huế: cơm hến, bánh bèo, chè Huế",
            "Ngồi thuyền rồng nghe ca Huế trên sông Hương",
            "Khám phá chùa Thiên Mụ, đồi Vọng Cảnh",
            "Trải nghiệm làm nón lá, tham quan làng hương",
            "Bao gồm vé máy bay khứ hồi, khách sạn 4 sao, xe đưa đón"
        ],
        itinerary: [
            {
                day: "Ngày 1",
                title: "Hà Nội - Huế - Khám phá Kinh thành",
                content: "Buổi sáng: Đón tại sân bay Phú Bài, đưa về khách sạn nhận phòng. Buổi trưa: Dùng cơm hến truyền thống. Buổi chiều: Tham quan Đại Nội Huế - Thái Hòa Điện, Cung Diên Thọ, Thế Miếu. Buổi tối: Thưởng thức âm nhạc cung đình tại nhà hàng."
            },
            {
                day: "Ngày 2",
                title: "Lăng tẩm hoàng gia",
                content: "Buổi sáng: Tham quan lăng Tự Đức - kiệt tác kiến trúc vườn lăng. Buổi trưa: Thưởng thức bánh khoái, nem lụi. Buổi chiều: Viếng lăng Khải Định với kiến trúc Đông Tây độc đáo, lăng Minh Mạng. Buổi tối: Tự do khám phá chợ đêm Đông Ba."
            },
            {
                day: "Ngày 3",
                title: "Chùa Thiên Mụ - Sông Hương",
                content: "Buổi sáng: Tham quan chùa Thiên Mụ, nghe chuông chùa và câu chuyện lịch sử. Buổi trưa: Thuyền rồng trên sông Hương, nghe ca Huế. Buổi chiều: Làng hương Thủy Xuân, tự tay làm nón lá. Buổi tối: Ăn tối tại nhà hàng ẩm thực cung đình."
            },
            {
                day: "Ngày 4",
                title: "Tự do & Trở về",
                content: "Buổi sáng: Tự do mua sắm đặc sản: mè xửng, trà sen, bánh bèo. Check out khách sạn. Buổi trưa: Dùng bữa trưa. Sau đó: Xe đưa ra sân bay Phú Bài, kết thúc chuyến đi."
            }
        ],
        gallery: [
            "https://images.pexels.com/photos/6976024/pexels-photo-6976024.jpeg",
            "https://images.pexels.com/photos/6976028/pexels-photo-6976028.jpeg",
            "https://images.pexels.com/photos/15213987/pexels-photo-15213987.jpeg",
            "https://images.pexels.com/photos/20124748/pexels-photo-20124748.jpeg",
            "https://images.pexels.com/photos/5604013/pexels-photo-5604013.jpeg"
        ]
    },
    'myson': {
        id: 'myson',
        name: "Di tích Mỹ Sơn",
        subtitle: "Thánh địa Chăm Pa cổ kính",
        location: "Quảng Nam",
        description: `
            <p>Di tích Mỹ Sơn là quần thể đền tháp Chăm Pa lớn nhất Việt Nam, được UNESCO công nhận là Di sản văn hóa thế giới.</p>
            <p>Nằm giữa thung lũng được bao quanh bởi núi non, Mỹ Sơn là nơi lưu giữ kiến trúc và nghệ thuật điêu khắc độc đáo của văn minh Chăm Pa từ thế kỷ IV đến thế kỷ XIII.</p>
        `,
        duration: "3 ngày 2 đêm",
        price: "5.199.000đ",
        image: "/assets/images/di_tich_my_son.jpg",
        badge: "HOT",
        highlights: [
            "Tham quan Thánh địa Mỹ Sơn - Quần thể đền tháp Chăm Pa từ thế kỷ IV",
            "Khám phá các nhóm tháp cổ A, B, C, D với kiến trúc độc đáo",
            "Thưởng thức múa Chăm truyền thống tại khu di tích",
            "Tham quan bảo tàng Chăm Pa với hiện vật cổ quý",
            "Kết hợp tour Hội An: Phố cổ đèn lồng, Chùa Cầu",
            "Thưởng thức ẩm thực Quảng Nam: Mì Quảng, cao lầu"
        ],
        itinerary: [
            {
                day: "Ngày 1",
                title: "Đà Nẵng - Mỹ Sơn - Hội An",
                content: "Buổi sáng: Khởi hành từ Đà Nẵng đến Thánh địa Mỹ Sơn. Tham quan các nhóm tháp A, B, C với kiến trúc Chăm độc đáo. Xem biểu diễn múa Apsara. Buổi chiều: Di chuyển đến Hội An. Buổi tối: Khám phá phố cổ Hội An với đèn lồng rực rỡ."
            },
            {
                day: "Ngày 2",
                title: "Khám phá Hội An",
                content: "Buổi sáng: Tham quan Chùa Cầu, Hội quán Phúc Kiến, Nhà cổ Tấn Ký. Trải nghiệm làm đèn lồng. Buổi chiều: Thuyền thúng rừng dừa Bảy Mẫu. Buổi tối: Thả đèn hoa đăng trên sông Hoài."
            },
            {
                day: "Ngày 3",
                title: "Làng nghề & Trở về",
                content: "Buổi sáng: Tham quan làng gốm Thanh Hà, làng rau Trà Quế. Mua sắm đặc sản. Buổi chiều: Check out, di chuyển ra sân bay Đà Nẵng."
            }
        ],
        gallery: [
            "https://images.pexels.com/photos/12737657/pexels-photo-12737657.jpeg",
            "https://images.pexels.com/photos/5977433/pexels-photo-5977433.jpeg",
            "https://images.pexels.com/photos/5977435/pexels-photo-5977435.jpeg",
            "https://images.pexels.com/photos/33501218/pexels-photo-33501218.jpeg",
            "https://images.pexels.com/photos/6045242/pexels-photo-6045242.jpeg"
        ]
    },
    'hoian': {
        id: 'hoian',
        name: "Phố cổ Hội An",
        subtitle: "Thành phố đèn lồng cổ kính",
        location: "Quảng Nam",
        description: `
            <p>Hội An là một trong những thành phố cổ được bảo tồn tốt nhất Đông Nam Á, nơi giao thoa văn hóa Việt - Hoa - Nhật.</p>
            <p>Những con phố nhỏ lát đá, nhà cổ rêu phong, cùng hàng nghìn chiếc đèn lồng lung linh tạo nên bức tranh cổ kính và lãng mạn độc nhất vô nhị.</p>
        `,
        duration: "4 ngày 3 đêm",
        price: "7.299.000đ",
        image: "/assets/images/pho_co_hoi_an.jpg",
        badge: "PHỔ BIẾN",
        highlights: [
            "Tham quan Phố cổ Hội An - Thả đèn hoa đăng trên sông Hoài",
            "Khám phá Chùa Cầu, Hội quán Phúc Kiến, Nhà cổ Tấn Ký",
            "Trải nghiệm làm đèn lồng thủ công",
            "Tham quan làng rau Trà Quế & làng gốm Thanh Hà",
            "Đi thuyền thúng dạo rừng dừa Bảy Mẫu",
            "Thưởng thức cao lầu, bánh mì Phượng, chè bắp"
        ],
        itinerary: [
            {
                day: "Ngày 1",
                title: "Đà Nẵng - Hội An - Check in phố cổ",
                content: "Đón tại sân bay Đà Nẵng, di chuyển đến Hội An. Check in khách sạn. Buổi chiều: Dạo phố cổ, chụp ảnh check-in Chùa Cầu. Buổi tối: Thưởng thức cao lầu, thả đèn hoa đăng trên sông Hoài."
            },
            {
                day: "Ngày 2",
                title: "Khám phá làng nghề",
                content: "Buổi sáng: Tham quan làng gốm Thanh Hà, tự tay nặn đồ gốm. Buổi trưa: Làng rau Trà Quế, học nấu món Việt. Buổi chiều: Thuyền thúng rừng dừa Bảy Mẫu."
            },
            {
                day: "Ngày 3",
                title: "Di tích và bãi biển",
                content: "Buổi sáng: Tham quan di tích Mỹ Sơn. Buổi chiều: Thư giãn tại bãi biển An Bàng hoặc Cửa Đại. Buổi tối: Mua sắm đặc sản tại chợ đêm."
            },
            {
                day: "Ngày 4",
                title: "Tự do & Trở về",
                content: "Buổi sáng: Tự do trải nghiệm làm đèn lồng, may áo dài. Check out. Buổi chiều: Di chuyển ra sân bay Đà Nẵng."
            }
        ],
        gallery: [
            "https://images.pexels.com/photos/33501218/pexels-photo-33501218.jpeg",
            "https://images.pexels.com/photos/4166444/pexels-photo-4166444.jpeg",
            "https://images.pexels.com/photos/4166431/pexels-photo-4166431.jpeg",
            "https://images.pexels.com/photos/4166459/pexels-photo-4166459.jpeg",
            "https://images.pexels.com/photos/4210830/pexels-photo-4210830.jpeg"
        ]
    },
    'quangtri': {
        id: 'quangtri',
        name: "Thành cổ Quảng Trị",
        subtitle: "Biểu tượng kiên cường bất khuất",
        location: "Quảng Trị",
        description: `
            <p>Thành cổ Quảng Trị là biểu tượng của sự kiên cường trong 81 ngày đêm chiến đấu hào hùng năm 1972.</p>
            <p>Nơi đây không chỉ là di tích lịch sử mà còn là bài học sống động về lòng yêu nước và ý chí bất khuất của dân tộc Việt Nam.</p>
        `,
        duration: "4 ngày 3 đêm",
        price: "6.499.000đ",
        image: "/assets/images/thanh_co_qt.jpg",
        badge: "LỊCH SỬ",
        highlights: [
            "Tham quan Thành cổ Quảng Trị - Di tích lịch sử cấp quốc gia",
            "Viếng Nghĩa trang Trường Sơn và Đường Hồ Chí Minh",
            "Khám phá địa đạo Vĩnh Mốc - Hệ thống hầm ngầm kỳ diệu",
            "Tham quan cầu Hiền Lương và sông Bến Hải",
            "Trải nghiệm văn hóa địa phương và làng nghề",
            "Thưởng thức đặc sản: Cháo cá lóc, bánh ướt thịt nướng"
        ],
        itinerary: [
            {
                day: "Ngày 1",
                title: "Đồng Hới - Quảng Trị",
                content: "Đón tại sân bay Đồng Hới. Di chuyển đến Quảng Trị. Buổi chiều: Tham quan Thành cổ Quảng Trị, tìm hiểu lịch sử 81 ngày đêm. Buổi tối: Check in khách sạn, dùng bữa tối."
            },
            {
                day: "Ngày 2",
                title: "Địa đạo Vĩnh Mốc",
                content: "Buổi sáng: Khám phá địa đạo Vĩnh Mốc - nghe câu chuyện về cuộc sống dưới lòng đất. Buổi chiều: Tham quan cầu Hiền Lương, sông Bến Hải. Buổi tối: Tự do nghỉ ngơi."
            },
            {
                day: "Ngày 3",
                title: "Nghĩa trang Trường Sơn",
                content: "Buổi sáng: Viếng Nghĩa trang Liệt sĩ Trường Sơn. Buổi chiều: Tham quan Đường Hồ Chí Minh trên cao tốc lịch sử. Buổi tối: Văn nghệ ca ngợi anh hùng liệt sĩ."
            },
            {
                day: "Ngày 4",
                title: "Trở về",
                content: "Buổi sáng: Mua sắm đặc sản địa phương. Check out. Buổi chiều: Di chuyển ra sân bay Đồng Hới, kết thúc hành trình."
            }
        ],
        gallery: [
            "https://images.pexels.com/photos/15213987/pexels-photo-15213987.jpeg",
            "https://images.pexels.com/photos/6976024/pexels-photo-6976024.jpeg",
            "https://images.pexels.com/photos/20124748/pexels-photo-20124748.jpeg",
            "https://images.pexels.com/photos/5604013/pexels-photo-5604013.jpeg",
            "https://images.pexels.com/photos/6976028/pexels-photo-6976028.jpeg"
        ]
    },
    'cuchi': {
        id: 'cuchi',
        name: "Địa đạo Củ Chi",
        subtitle: "Biểu tượng kháng chiến huyền thoại",
        location: "Hồ Chí Minh",
        description: `
            <p>Địa đạo Củ Chi là hệ thống đường hầm dài hơn 250km được xây dựng trong kháng chiến chống Mỹ.</p>
            <p>Đây là minh chứng sống động cho sự sáng tạo, kiên cường và bất khuất của quân dân Việt Nam trong cuộc chiến vệ quốc.</p>
        `,
        duration: "4 ngày 3 đêm",
        price: "5.999.000đ",
        image: "/assets/images/dia_dao_cu_chi.jpg",
        badge: "LỊCH SỬ",
        highlights: [
            "Tham quan địa đạo Bến Dược & Bến Đình",
            "Trải nghiệm bò địa đạo, bắn súng AK tại trường bắn",
            "Khám phá căn cứ địa cách mạng, bẫy chiến tranh",
            "Xem phim tài liệu về lịch sử 1960-1975",
            "Thưởng thức bánh tráng muối ớt, khoai mì nướng",
            "Kết hợp tham quan Sài Gòn: Nhà thờ Đức Bà, Bưu điện"
        ],
        itinerary: [
            {
                day: "Ngày 1",
                title: "Sài Gòn - Củ Chi",
                content: "Đón tại sân bay Tân Sơn Nhất. Di chuyển đến Củ Chi. Buổi chiều: Tham quan địa đạo Bến Dược. Trải nghiệm bò hầm, bắn súng. Buổi tối: Về Sài Gòn, dạo phố đi bộ Nguyễn Huệ."
            },
            {
                day: "Ngày 2",
                title: "City Tour Sài Gòn",
                content: "Buổi sáng: Tham quan Nhà thờ Đức Bà, Bưu điện Trung tâm, Dinh Độc Lập. Buổi trưa: Ăn phở tại Phở Hòa. Buổi chiều: Chợ Bến Thành, mua sắm. Buổi tối: Du ngoạn sông Sài Gòn."
            },
            {
                day: "Ngày 3",
                title: "Vùng lân cận",
                content: "Buổi sáng: Tham quan chùa Vĩnh Nghiêm, Thiên Hậu. Buổi chiều: Tự do khám phá quận 1. Buổi tối: Thưởng thức ẩm thực đường phố."
            },
            {
                day: "Ngày 4",
                title: "Trở về",
                content: "Buổi sáng: Mua sắm đặc sản: khô bò, cà phê. Check out. Buổi chiều: Ra sân bay Tân Sơn Nhất."
            }
        ],
        gallery: [
            "https://images.pexels.com/photos/4331502/pexels-photo-4331502.jpeg",
            "https://images.pexels.com/photos/3217911/pexels-photo-3217911.jpeg",
            "https://images.pexels.com/photos/4331497/pexels-photo-4331497.jpeg",
            "https://images.pexels.com/photos/4210355/pexels-photo-4210355.jpeg",
            "https://images.pexels.com/photos/4210371/pexels-photo-4210371.jpeg"
        ]
    }
};

// ===== XỬ LÝ TRANG DETAIL =====

// Lấy ID từ URL
function getTourIdFromURL() {
    const params = new URLSearchParams(window.location.search);
    return params.get('id');
}

// Load dữ liệu tour
function loadTourData() {
    const tourId = getTourIdFromURL();
    const tour = toursData[tourId];

    if (!tour) {
        alert('Không tìm thấy tour này!');
        window.location.href = '/';
        return;
    }

    // Hero Section
    document.getElementById('heroSection').style.backgroundImage = `url('${tour.image}')`;
    document.getElementById('tourBadge').textContent = tour.badge;
    document.getElementById('tourTitle').textContent = tour.name;
    document.getElementById('tourSubtitle').textContent = tour.subtitle;
    document.getElementById('tourDuration').textContent = tour.duration;
    document.getElementById('tourLocation').textContent = tour.location;

    // Description
    document.getElementById('tourDescription').innerHTML = tour.description;

    // Highlights
    const highlightsList = document.getElementById('tourHighlights');
    highlightsList.innerHTML = tour.highlights.map(highlight => 
        `<li>${highlight}</li>`
    ).join('');

    // Gallery
    const galleryGrid = document.getElementById('galleryGrid');
    galleryGrid.innerHTML = tour.gallery.map(img => 
        `<div class="gallery-item" onclick="openLightbox('${img}')">
            <img src="${img}" alt="${tour.name}">
        </div>`
    ).join('');

    // Itinerary
    const itineraryContainer = document.getElementById('itineraryContainer');
    itineraryContainer.innerHTML = tour.itinerary.map((item, index) => 
        `<div class="day-item ${index === 0 ? 'active' : ''}" onclick="toggleDay(this)">
            <div class="day-header">
                <span><strong>${item.day}:</strong> ${item.title}</span>
                <i class="fas fa-chevron-down"></i>
            </div>
            <div class="day-content">
                <div class="day-content-inner">
                    ${item.content}
                </div>
            </div>
        </div>`
    ).join('');

    // Sidebar
    document.getElementById('tourPrice').textContent = tour.price;
    document.getElementById('sidebarDuration').textContent = tour.duration;

    // Nút đặt tour - chuyển đến trang service
    const bookButtons = [
        document.getElementById('btnBook'),
        document.getElementById('btnBookLarge')
    ];

    bookButtons.forEach(btn => {
        btn.onclick = () => {
            // Chuyển đến trang service (cùng thư mục)
            window.location.href = '/service';
        };
    });
}

// Toggle accordion lịch trình
function toggleDay(element) {
    const wasActive = element.classList.contains('active');
    
    // Đóng tất cả các ngày khác
    document.querySelectorAll('.day-item').forEach(item => {
        item.classList.remove('active');
    });
    
    // Mở ngày được click (nếu nó đang đóng)
    if (!wasActive) {
        element.classList.add('active');
    }
}

// Lightbox cho gallery
function openLightbox(imageSrc) {
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightboxImg');
    lightboxImg.src = imageSrc;
    lightbox.classList.add('active');
}

function closeLightbox() {
    document.getElementById('lightbox').classList.remove('active');
}

// Khởi tạo khi trang load
document.addEventListener('DOMContentLoaded', function() {
    loadTourData();
    
    // Xử lý ESC để đóng lightbox
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeLightbox();
        }
    });
});