const slide = document.getElementById('slide');
let autoSlide;

function nextSlide() {
    let items = document.querySelectorAll('.item');
    slide.appendChild(items[0]);
}

function prevSlide() {
    let items = document.querySelectorAll('.item');
    slide.prepend(items[items.length - 1]);
}

function startAutoSlide() {
    autoSlide = setInterval(nextSlide, 7000);
}

function resetAutoSlide() {
    clearInterval(autoSlide);
    startAutoSlide();
}

document.getElementById('next').onclick = () => {
    nextSlide();
    resetAutoSlide();
};

document.getElementById('prev').onclick = () => {
    prevSlide();
    resetAutoSlide();
};

startAutoSlide();
