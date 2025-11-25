let avatarDataUrl = '';

// Xử lý tải ảnh đại diện
document.getElementById('avatarInput').addEventListener('change', function(e) {
    const file = e.target.files[0];
    if (file) {
        const reader = new FileReader();
        reader.onload = function(event) {
            avatarDataUrl = event.target.result;
            const avatarPreview = document.getElementById('avatarPreview');
            avatarPreview.innerHTML = `<img src="${avatarDataUrl}" alt="Avatar">`;
        };
        reader.readAsDataURL(file);
    }
});

// Xử lý submit form
document.getElementById('profileForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const username = document.getElementById('username').value;
    const phone = document.getElementById('phone').value;
    const email = document.getElementById('email').value;
    const address = document.getElementById('address').value;
    const job = document.getElementById('job').value;
    const bio = document.getElementById('bio').value;

    // Hiển thị preview
    document.getElementById('previewName').textContent = username;
    document.getElementById('previewJob').textContent = job;
    document.getElementById('previewEmail').textContent = email;
    document.getElementById('previewPhone').textContent = phone;
    document.getElementById('previewAddress').textContent = address;

    // Hiển thị tiểu sử nếu có
    if (bio) {
        document.getElementById('previewBio').textContent = bio;
        document.getElementById('bioSection').style.display = 'flex';
    } else {
        document.getElementById('bioSection').style.display = 'none';
    }

    // Hiển thị avatar
    if (avatarDataUrl) {
        document.getElementById('previewAvatar').innerHTML = `<img src="${avatarDataUrl}" alt="Avatar">`;
    } else {
        document.getElementById('previewAvatar').innerHTML = '<span class="avatar-placeholder">👤</span>';
    }

    // Ẩn form và hiển thị preview
    document.getElementById('profileForm').style.display = 'none';
    document.getElementById('profilePreview').classList.add('show');
});

// Chỉnh sửa profile
function editProfile() {
    document.getElementById('profileForm').style.display = 'block';
    document.getElementById('profilePreview').classList.remove('show');
}