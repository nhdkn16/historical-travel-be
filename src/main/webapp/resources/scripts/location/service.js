// Dữ liệu tour
const tours = [
    {
        id: 1,
        name: "Cố đô Huế - 4N3Đ",
        description: "Hành trình khám phá Kinh đô xưa với hệ thống lăng tẩm, cung điện, chùa chiền và văn hóa cung đình đặc sắc.",
        duration: "4 ngày 3 đêm",
        price: "6.999.000đ",
        numericPrice: 6999000,
        image: "https://i.pinimg.com/736x/78/22/c6/7822c67a08a47b14cfc575e63f9b4667.jpg",
        features: [
            "Tham quan Đại Nội - Kinh thành Huế (Di sản UNESCO)",
            "Viếng lăng Tự Đức, lăng Khải Định, lăng Minh Mạng",
            "Thưởng thức ẩm thực cung đình Huế: cơm hến, bánh bèo, chè Huế",
            "Ngồi thuyền rồng nghe ca Huế trên sông Hương",
            "Khám phá chùa Thiên Mụ, đồi Vọng Cảnh",
            "Trải nghiệm làm nón lá, tham quan làng hương",
            "Bao gồm vé máy bay khứ hồi, khách sạn 4 sao, xe đưa đón"
        ],
        badge: "HOT"
    },
    {
        id: 2,
        name: "Di tích Mỹ Sơn - 3N2Đ",
        description: "Hành trình khám phá quần thể di tích Chăm Pa cổ kính - Di sản văn hóa thế giới UNESCO, với những đền tháp huyền bí giữa rừng xanh Quảng Nam.",
        duration: "3 ngày 2 đêm",
        price: "5.199.000đ",
        numericPrice: 7499000,
        image: "https://i.pinimg.com/736x/52/09/98/520998a6981bf884ded4604d3211315e.jpg",
        features: [
            "Tham quan Thánh địa Mỹ Sơn - Quần thể đền tháp Chăm Pa từ thế kỷ IV (Di sản UNESCO)",
            "Khám phá các nhóm tháp cổ A, B, C, D với kiến trúc độc đáo và phù điêu tinh xảo",
            "Thưởng thức múa Chăm truyền thống và biểu diễn văn nghệ tại khu di tích",
            "Tham quan bảo tàng Chăm Pa trưng bày hiện vật cổ: linga, phù điêu, gạch nung",
            "Kết hợp tour Hội An: Phố cổ đèn lồng, Chùa Cầu, làng gốm Thanh Hà",
            "Thưởng thức ẩm thực Quảng Nam: Mì Quảng, cao lầu, bánh tráng thịt heo",
            "Bao gồm vé máy bay khứ hồi, khách sạn 4 sao, xe đưa đón, hướng dẫn viên"
        ],
        badge: "Hot"
    },
    {
        id: 3,
        name: "Phố cổ Hội An - 4N3Đ",
        description: "Khám phá đô thị cổ kính bên sông Hoài - Di sản văn hóa thế giới UNESCO với những ngôi nhà rêu phong, đèn lồng rực rỡ và không khí hoài cổ.",
        duration: "4 ngày 3 đêm",
        price: "7.299.000đ",
        numericPrice: 7299000,
        image: "https://images.pexels.com/photos/33501218/pexels-photo-33501218.jpeg",
        features: [
            "Tham quan Phố cổ Hội An về đêm - Thả đèn hoa đăng trên sông Hoài",
            "Khám phá các công trình nổi bật: Chùa Cầu, Hội quán Phúc Kiến, Nhà cổ Tấn Ký",
            "Trải nghiệm làm đèn lồng thủ công tại làng nghề truyền thống",
            "Tham quan làng rau Trà Quế & làng gốm Thanh Hà",
            "Đi thuyền thúng dạo rừng dừa Bảy Mẫu, câu cá, chèo SUP",
            "Thưởng thức ẩm thực Hội An: Cao lầu, bánh mì Phượng, chè bắp, nước mót",
            "Bao gồm vé máy bay khứ hồi, khách sạn 4 sao, xe đưa đón, hướng dẫn viên"
    ],
        badge: "PHỔ BIẾN"
    },
    {
        id: 4,
        name: "Thành cổ Quảng Trị - 4N3Đ",
        description: "Hành trình về với lịch sử hào hùng của dân tộc tại Thành cổ Quảng Trị - Biểu tượng của sự kiên cường qua 81 ngày đêm chiến đấu năm 1972, kết hợp khám phá văn hóa và thiên nhiên miền Trung.",
        duration: "4 ngày 3 đêm",
        price: "6.499.000đ",
        numericPrice: 6499000,
        image: "/assets/images/thanh_co_qt.jpg",
        features: [
            "Tham quan Thành cổ Quảng Trị - Di tích lịch sử cấp quốc gia, nơi diễn ra trận đánh 81 ngày đêm lịch sử",
            "Viếng Nghĩa trang Trường Sơn và Đường Hồ Chí Minh trên cao tốc lịch sử",
            "Khám phá địa đạo Vĩnh Mốc - Hệ thống hầm ngầm kỳ diệu giữa bom đạn",
            "Tham quan cầu Hiền Lương và sông Bến Hải - Biểu tượng chia cắt hai miền",
            "Trải nghiệm văn hóa địa phương: Lễ hội chùa Cửa Tùng, làng nghề đan lát",
            "Thưởng thức đặc sản Quảng Trị: Cháo cá lóc, bánh ướt thịt nướng, trái cây Cầu Muối",
            "Bao gồm vé máy bay khứ hồi, khách sạn 4 sao, xe đưa đón, hướng dẫn viên chuyên lịch sử"
        ],
        badge: "MỚI"
    },
    {
        id: 5,
        name: "Địa đạo Củ Chi - 4N3Đ",
        description: "Hành trình khám phá hệ thống địa đạo huyền thoại Củ Chi - Biểu tượng của tinh thần bất khuất trong kháng chiến chống Mỹ, nơi du kích Việt Nam sinh tồn và chiến đấu dưới lòng đất.",
        duration: "4 ngày 3 đêm",
        price: "5.999.000đ",
        numericPrice: 5999000,
        image: "https://ik.imagekit.io/tvlk/blog/2022/08/dia-dao-cu-chi-2-683x1024.jpg?tr=dpr-2,w-675",
        features: [
            "Tham quan địa đạo Bến Dược & Bến Đình - Hệ thống hầm ngầm dài 250km với các lớp phòng thủ đa tầng",
            "Trải nghiệm bò địa đạo, bắn súng AK, súng trường tại trường bắn thực tế",
            "Khám phá căn cứ địa cách mạng, bẫy chiến tranh, lò nung vũ khí",
            "Xem phim tài liệu về lịch sử 1960-1975 và nghe hướng dẫn viên kể chuyện sống động",
            "Thưởng thức đặc sản Củ Chi: Bánh tráng muối ớt, khoai mì nướng, cơm nắm muối vừng",
            "Kết hợp tham quan Sài Gòn: Nhà thờ Đức Bà, Bưu điện Trung tâm, chợ Bến Thành",
            "Bao gồm vé máy bay khứ hồi, khách sạn 4 sao, xe đưa đón, hướng dẫn viên lịch sử"
    ],
        badge: "Lịch sử"
    },
];



// Lưu trữ bookings
let bookings = [];

// Hiển thị tours
function displayTours() {
    const toursList = document.getElementById('toursList');
    toursList.innerHTML = tours.map(tour => `
        <div class="tour-item">
            <div class="tour-image" style="background-image: url('${tour.image}')">
                <span class="tour-badge">${tour.badge}</span>
            </div>
            <div class="tour-details">
                <h3 class="tour-title">${tour.name}</h3>
                <p class="tour-description">${tour.description}</p>
                
                <ul class="tour-features">
                    ${tour.features.map(feature => `<li>${feature}</li>`).join('')}
                </ul>
                
                <div class="tour-info">
                    <div class="tour-duration">
                        <span>⏱️</span>
                        <span>${tour.duration}</span>
                    </div>
                    <div class="tour-price-section">
                        <div class="tour-price-label">Giá chỉ từ</div>
                        <div class="tour-price">${tour.price}</div>
                    </div>
                </div>
                
                <button class="btn-book-now" onclick="openBookingModal(${tour.id})">
                    🎫 Đặt Ngay
                </button>
            </div>
        </div>
    `).join('');
}

// Tìm kiếm địa điểm với API
async function searchLocation(query) {
    const searchResults = document.getElementById('searchResults');
    
    if (!query || query.trim().length < 2) {
        searchResults.classList.remove('active');
        return;
    }
    
    searchResults.innerHTML = '<div class="loading">Đang tìm kiếm...</div>';
    searchResults.classList.add('active');
    
    try {
        // Sử dụng Nominatim API (OpenStreetMap) để tìm kiếm địa điểm
        const response = await fetch(
            `https://nominatim.openstreetmap.org/search?format=json&q=${encodeURIComponent(query)}&limit=5&accept-language=vi`
        );
        
        const data = await response.json();
        
        if (data.length === 0) {
            searchResults.innerHTML = '<div class="loading">Không tìm thấy kết quả</div>';
            return;
        }
        
        searchResults.innerHTML = data.map(place => `
            <div class="search-result-item" onclick="selectLocation('${place.display_name}')">
                <div class="result-name">📍 ${place.name || place.display_name.split(',')[0]}</div>
                <div class="result-location">${place.display_name}</div>
            </div>
        `).join('');
        
    } catch (error) {
        console.error('Lỗi tìm kiếm:', error);
        searchResults.innerHTML = '<div class="loading">Có lỗi xảy ra khi tìm kiếm</div>';
    }
}

// Chọn địa điểm từ kết quả tìm kiếm
function selectLocation(locationName) {
    document.getElementById('searchInput').value = locationName;
    document.getElementById('searchResults').classList.remove('active');
    
    // Có thể thêm logic lọc tours theo địa điểm ở đây
    alert(`Đã chọn: ${locationName}\nChức năng lọc tour theo địa điểm sẽ được cập nhật!`);
}

// Debounce cho tìm kiếm
let searchTimeout;
document.getElementById('searchInput').addEventListener('input', (e) => {
    clearTimeout(searchTimeout);
    searchTimeout = setTimeout(() => {
        searchLocation(e.target.value);
    }, 500);
});

// Nút tìm kiếm
document.getElementById('searchBtn').addEventListener('click', () => {
    const query = document.getElementById('searchInput').value;
    searchLocation(query);
});

// Đóng kết quả tìm kiếm khi click bên ngoài
document.addEventListener('click', (e) => {
    const searchBox = document.querySelector('.search-box');
    const searchResults = document.getElementById('searchResults');
    
    if (!searchBox.contains(e.target) && !searchResults.contains(e.target)) {
        searchResults.classList.remove('active');
    }
});

// Biến lưu giá tour hiện tại
let currentTourPrice = 0;

// Mở modal đặt vé
function openBookingModal(tourId) {
    const tour = tours.find(t => t.id === tourId);
    currentTourPrice = tour.numericPrice;
    
    document.getElementById('tourId').value = tour.id;
    document.getElementById('tourName').value = tour.name;
    document.getElementById('tourPrice').value = tour.price;
    document.getElementById('bookingModal').style.display = 'block';
    
    // Set ngày tối thiểu là ngày mai
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    document.getElementById('departureDate').min = tomorrow.toISOString().split('T')[0];
    
    // Cập nhật tổng tiền ban đầu
    updateTotalAmount();
}

// Cập nhật tổng tiền
function updateTotalAmount() {
    const numPeopleSelect = document.getElementById('numPeople');
    const numPeople = parseInt(numPeopleSelect.value) || 1;
    const total = currentTourPrice * numPeople;
    document.getElementById('totalAmount').textContent = formatCurrency(total);
}

// Lắng nghe thay đổi số người
document.addEventListener('DOMContentLoaded', function() {
    const numPeopleSelect = document.getElementById('numPeople');
    if (numPeopleSelect) {
        numPeopleSelect.addEventListener('change', updateTotalAmount);
    }
});

// Format số tiền
function formatCurrency(amount) {
    return new Intl.NumberFormat('vi-VN', {
        style: 'currency',
        currency: 'VND'
    }).format(amount);
}

// Đóng modal
function closeBookingModal() {
    document.getElementById('bookingModal').style.display = 'none';
}

window.onclick = function(event) {
    const modal = document.getElementById('bookingModal');
    if (event.target == modal) {
        modal.style.display = 'none';
    }
}

// Xử lý form đặt vé
document.getElementById('bookingForm').onsubmit = async function(e) {
    e.preventDefault();
    
    const tour = tours.find(t => t.id == document.getElementById('tourId').value);
    const numPeople = parseInt(document.getElementById('numPeople').value) || 1;
    const totalAmount = tour.numericPrice * numPeople;
    
    const booking = {
        id: Date.now(),
        tourId: document.getElementById('tourId').value,
        tourName: document.getElementById('tourName').value,
        tourPrice: document.getElementById('tourPrice').value,
        customerName: document.getElementById('customerName').value,
        customerPhone: document.getElementById('customerPhone').value,
        customerEmail: document.getElementById('customerEmail').value,
        departureDate: document.getElementById('departureDate').value,
        numPeople: document.getElementById('numPeople').value,
        notes: document.getElementById('notes').value,
        paymentMethod: document.getElementById('paymentMethod').value,
        totalAmount: formatCurrency(totalAmount),
        bookingDate: new Date().toLocaleDateString('vi-VN'),
        paymentStatus: 'pending'
    };

    // Đóng modal booking
    document.getElementById('bookingModal').style.display = 'none';
    
    // Xử lý thanh toán
    const paymentSuccess = await processPayment(booking);
    
    if (paymentSuccess) {
        booking.paymentStatus = 'completed';
        bookings.push(booking);
        displayBookings();
        
        // Gửi email xác nhận
        await sendConfirmationEmail(booking);
        
        // Hiển thị thông báo thành công
        const successMsg = document.getElementById('successMessage');
        successMsg.style.display = 'block';
        setTimeout(() => {
            successMsg.style.display = 'none';
        }, 5000);
        
        // Reset form
        document.getElementById('bookingForm').reset();
        
        // Scroll đến danh sách booking
        document.getElementById('bookings').scrollIntoView({ behavior: 'smooth' });
    }
}

// Xử lý thanh toán
async function processPayment(booking) {
    return new Promise((resolve) => {
        // Hiển thị modal thanh toán
        const paymentModal = document.getElementById('paymentModal');
        paymentModal.style.display = 'block';
        
        // Hiển thị bước 1: Đang tạo mã QR
        showPaymentStep(1);
        
        // Lấy thông tin phương thức thanh toán
        const paymentMethods = {
            'momo': { name: 'MoMo', icon: '💰', app: 'MoMo' },
            'zalopay': { name: 'ZaloPay', icon: '💳', app: 'ZaloPay' },
            'vnpay': { name: 'VNPay', icon: '🏦', app: 'VNPay' },
            'bank': { name: 'Chuyển khoản ngân hàng', icon: '🏧', app: 'Banking' },
            'credit': { name: 'Thẻ tín dụng', icon: '💳', app: 'Banking' }
        };
        
        const method = paymentMethods[booking.paymentMethod];
        
        // Giả lập tạo mã QR (2 giây)
        setTimeout(() => {
            // Tạo mã QR
            generateQRCode(booking, method);
            
            // Hiển thị bước 2: Quét mã QR
            showPaymentStep(2);
            
            // Bắt đầu đếm ngược 5 phút
            startCountdown();
            
            // Tự động kiểm tra thanh toán sau 8 giây (giả lập)
            setTimeout(() => {
                completePayment(booking);
                resolve(true);
            }, 8000);
            
        }, 2000);
    });
}

// Tạo mã QR thanh toán
function generateQRCode(booking, method) {
    const amount = booking.totalAmount.replace(/[^\d]/g, ''); // Lấy số tiền
    const bookingId = booking.id;
    
    // Nội dung thanh toán
    let qrContent = '';
    
    if (booking.paymentMethod === 'bank') {
        // Chuyển khoản ngân hàng - hiển thị thông tin
        qrContent = `TravelVN ${bookingId}`;
        document.getElementById('bankTransferInfo').style.display = 'block';
        document.getElementById('bankAmount').textContent = booking.totalAmount;
        document.getElementById('transferContent').textContent = `TRAVELVN ${bookingId}`;
    } else {
        // Ví điện tử - tạo QR theo định dạng
        if (booking.paymentMethod === 'momo') {
            qrContent = `2|99|${booking.customerPhone}|${booking.customerName}|${booking.customerEmail}|0|0|${amount}|TravelVN ${bookingId}`;
        } else if (booking.paymentMethod === 'zalopay') {
            qrContent = `https://zalopay.vn/pay/${bookingId}?amount=${amount}`;
        } else if (booking.paymentMethod === 'vnpay') {
            qrContent = `https://vnpay.vn/payment?amount=${amount}&order=${bookingId}`;
        } else {
            qrContent = `PAYMENT|${amount}|${bookingId}|${booking.customerName}`;
        }
    }
    
    // Sử dụng API tạo QR Code miễn phí
    const qrApiUrl = `https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=${encodeURIComponent(qrContent)}`;
    
    // Hiển thị QR code
    document.getElementById('qrCodeImage').src = qrApiUrl;
    document.getElementById('paymentMethodIcon').textContent = method.icon;
    document.getElementById('paymentMethodName').textContent = method.name;
    document.getElementById('appName').textContent = method.app;
    document.getElementById('paymentAmountDisplay').textContent = booking.totalAmount;
}

// Đếm ngược thời gian
let countdownTimer;
function startCountdown() {
    let timeLeft = 300; // 5 phút = 300 giây
    
    countdownTimer = setInterval(() => {
        timeLeft--;
        
        const minutes = Math.floor(timeLeft / 60);
        const seconds = timeLeft % 60;
        
        document.getElementById('countdown').textContent = 
            `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
        
        if (timeLeft <= 0) {
            clearInterval(countdownTimer);
            alert('Mã QR đã hết hạn. Vui lòng thử lại!');
            closePaymentModal();
        }
    }, 1000);
}

// Hiển thị bước thanh toán
function showPaymentStep(step) {
    document.getElementById('paymentStep1').style.display = step === 1 ? 'block' : 'none';
    document.getElementById('paymentStep2').style.display = step === 2 ? 'block' : 'none';
    document.getElementById('paymentStep3').style.display = step === 3 ? 'block' : 'none';
}

// Kiểm tra trạng thái thanh toán
function checkPaymentStatus() {
    const btn = event.target;
    btn.textContent = '⏳ Đang kiểm tra...';
    btn.disabled = true;
    
    // Giả lập kiểm tra (2 giây)
    setTimeout(() => {
        btn.textContent = '🔄 Kiểm Tra Thanh Toán';
        btn.disabled = false;
        alert('Chưa nhận được thanh toán. Vui lòng quét mã QR và thử lại!');
    }, 2000);
}

// Hoàn thành thanh toán
function completePayment(booking) {
    clearInterval(countdownTimer);
    showPaymentStep(3);
    
    const successMsg = document.getElementById('successMessage');
    successMsg.innerHTML = `
        Giao dịch đã được xử lý thành công!<br>
        <strong>Mã đặt vé:</strong> #${booking.id}<br>
        <strong>Số tiền:</strong> ${booking.totalAmount}
    `;
}

// Đóng modal thanh toán
function closePaymentModal() {
    clearInterval(countdownTimer);
    document.getElementById('paymentModal').style.display = 'none';
    showPaymentStep(1);
    document.getElementById('bankTransferInfo').style.display = 'none';
}

// Gửi email xác nhận (sử dụng EmailJS hoặc giả lập)
async function sendConfirmationEmail(booking) {
    return new Promise((resolve) => {
        // Giả lập gửi email
        console.log('📧 Đang gửi email xác nhận đến:', booking.customerEmail);
        
        const emailContent = `
        ========================================
        🎉 XÁC NHẬN ĐẶT VÉ THÀNH CÔNG
        ========================================
        
        Kính gửi: ${booking.customerName}
        
        Cảm ơn bạn đã đặt tour tại TravelVN!
        
        THÔNG TIN ĐẶT VÉ:
        ------------------
        Mã đặt vé: #${booking.id}
        Tour: ${booking.tourName}
        Ngày khởi hành: ${new Date(booking.departureDate).toLocaleDateString('vi-VN')}
        Số người: ${booking.numPeople}
        Tổng tiền: ${booking.totalAmount}
        
        THÔNG TIN KHÁCH HÀNG:
        ------------------
        Họ tên: ${booking.customerName}
        Điện thoại: ${booking.customerPhone}
        Email: ${booking.customerEmail}
        ${booking.notes ? `Ghi chú: ${booking.notes}` : ''}
        
        THANH TOÁN:
        ------------------
        Phương thức: ${booking.paymentMethod.toUpperCase()}
        Trạng thái: ĐÃ THANH TOÁN ✅
        Ngày thanh toán: ${booking.bookingDate}
        
        ========================================
        
        Chúng tôi sẽ liên hệ với bạn trong vòng 24h để xác nhận thông tin chi tiết.
        
        Hotline hỗ trợ: 1900-xxxx
        Email: hoangch.24itb@vku.udn.vn
        
        Trân trọng,
        DH Team
        `;
        
        console.log(emailContent);
        
        // Trong thực tế, bạn sẽ sử dụng service như EmailJS, SendGrid, hoặc backend API
        // Ví dụ với EmailJS:
        /*
        emailjs.send('service_id', 'template_id', {
            to_email: booking.customerEmail,
            to_name: booking.customerName,
            booking_id: booking.id,
            tour_name: booking.tourName,
            total_amount: booking.totalAmount,
            // ... các thông tin khác
        }).then(() => {
            console.log('✅ Email đã được gửi thành công!');
            resolve(true);
        });
        */
        
        setTimeout(() => {
            console.log('✅ Email xác nhận đã được gửi thành công!');
            resolve(true);
        }, 1000);
    });
}

// Hiển thị danh sách bookings
function displayBookings() {
    const bookingsList = document.getElementById('bookingsList');
    
    if (bookings.length === 0) {
        bookingsList.innerHTML = `
            <div class="empty-state">
                <svg viewBox="0 0 24 24" fill="currentColor">
                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/>
                </svg>
                <p>Chưa có đặt vé nào. Hãy chọn tour yêu thích và đặt ngay!</p>
            </div>
        `;
        return;
    }

    bookingsList.innerHTML = bookings.map(booking => `
        <div class="booking-item">
            <h3>${booking.tourName}</h3>
            <div class="booking-info">
                <p><strong>Mã đặt:</strong> #${booking.id}</p>
                <p><strong>Ngày đặt:</strong> ${booking.bookingDate}</p>
                <p><strong>Khách hàng:</strong> ${booking.customerName}</p>
                <p><strong>Số điện thoại:</strong> ${booking.customerPhone}</p>
                <p><strong>Email:</strong> ${booking.customerEmail}</p>
                <p><strong>Ngày khởi hành:</strong> ${new Date(booking.departureDate).toLocaleDateString('vi-VN')}</p>
                <p><strong>Số người:</strong> ${booking.numPeople}</p>
                <p><strong>Tổng tiền:</strong> ${booking.totalAmount}</p>
                <p><strong>Thanh toán:</strong> ${getPaymentMethodName(booking.paymentMethod)} - ✅ Đã thanh toán</p>
                ${booking.notes ? `<p><strong>Ghi chú:</strong> ${booking.notes}</p>` : ''}
            </div>
        </div>
    `).reverse().join('');
}

// Lấy tên phương thức thanh toán
function getPaymentMethodName(method) {
    const methods = {
        'momo': 'MoMo',
        'zalopay': 'ZaloPay',
        'vnpay': 'VNPay',
        'bank': 'Chuyển khoản',
        'credit': 'Thẻ tín dụng'
    };
    return methods[method] || method;
}

// Khởi tạo
displayTours();
displayBookings();