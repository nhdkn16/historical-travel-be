function toggleDay(element) {
    const wasActive = element.classList.contains('active');
    document.querySelectorAll('.day-item').forEach(item => item.classList.remove('active'));
    if (!wasActive) element.classList.add('active');
}

function openLightbox(imageSrc) {
    const lightbox = document.getElementById('lightbox');
    const lightboxImg = document.getElementById('lightboxImg');
    lightboxImg.src = imageSrc;
    lightbox.classList.add('active');
}

function closeLightbox() {
    document.getElementById('lightbox').classList.remove('active');
}

document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') closeLightbox();
});
