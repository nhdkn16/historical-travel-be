let currentBooking = null;
let countdownTimer = null;

function openBookingModal(tourId, scheduleId, tourName) {
    currentBooking = {
        tourId: tourId,
        scheduleId: scheduleId,
        tourName: tourName,
        customerName: "",
        customerPhone: "",
        paymentMethod: ""
    };

    document.getElementById("modalTourId").value = tourId;
    document.getElementById("modalScheduleId").value = scheduleId;
    document.getElementById("bookingModal").style.display = "block";
}

function closeBookingModal() {
    document.getElementById("bookingModal").style.display = "none";
}

function startPaymentProcess() {
    closeBookingModal();
    openPaymentModal();
    return false;
}

document.getElementById("bookingForm").addEventListener("submit", function (e) {
    e.preventDefault();

    currentBooking.customerName = document.getElementById("customerName").value;
    currentBooking.customerPhone = document.getElementById("customerPhone").value;
    currentBooking.paymentMethod = document.getElementById("paymentMethod").value;

    closeBookingModal();
    openPaymentModal();
});

function openPaymentModal() {
    document.getElementById("paymentModal").style.display = "block";
    showPaymentStep(1);

    setTimeout(() => {
        generateQRCode();
        showPaymentStep(2);
        startCountdown();

        setTimeout(() => {
            completePayment();
        }, 8000);
    }, 2000);
}

function closePaymentModal() {
    clearInterval(countdownTimer);
    document.getElementById("paymentModal").style.display = "none";
    showPaymentStep(1);
}

function showPaymentStep(step) {
    document.getElementById("paymentStep1").style.display =
        step === 1 ? "block" : "none";
    document.getElementById("paymentStep2").style.display =
        step === 2 ? "block" : "none";
    document.getElementById("paymentStep3").style.display =
        step === 3 ? "block" : "none";
}

function generateQRCode() {
    const content = `PAY|${currentBooking.tourId}|${Date.now()}`;
    const qrUrl = `https://api.qrserver.com/v1/create-qr-code/?size=250x250&data=${encodeURIComponent(
        content
    )}`;

    document.getElementById("qrCodeImage").src = qrUrl;
}

function startCountdown() {
    let timeLeft = 300;

    countdownTimer = setInterval(() => {
        timeLeft--;

        const min = Math.floor(timeLeft / 60);
        const sec = timeLeft % 60;

        document.getElementById("countdown").textContent =
            `${String(min).padStart(2, "0")}:${String(sec).padStart(2, "0")}`;

        if (timeLeft <= 0) {
            clearInterval(countdownTimer);
            alert("QR hết hạn, vui lòng đặt lại!");
            closePaymentModal();
        }
    }, 1000);
}

function completePayment() {
    clearInterval(countdownTimer);
    showPaymentStep(3);

    document.getElementById("successMessage").innerHTML = `
        Tour: ${currentBooking.tourName}<br>
        Khách hàng: ${currentBooking.customerName}
    `;
}

function finish() {
    document.getElementById("paymentModal").style.display = "none";
}
