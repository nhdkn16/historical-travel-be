if (localStorage.getItem('isAdminLoggedIn') !== 'true') {
    window.location.href = '/login';
}

let locations = [];
let editingId = null;

function loadLocations() {
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    locations = adminData.locations || [];
    renderLocations();
}

function renderLocations() {
    const tbody = document.querySelector('#locationsTable tbody');
    tbody.innerHTML = '';
    document.getElementById('locationCount').textContent = locations.length;
    
    locations.forEach(location => {
        const row = tbody.insertRow();
        row.innerHTML = `
            <td>${location.id}</td>
            <td><strong>${location.name}</strong></td>
            <td>${location.city}</td>
            <td>${location.lat}, ${location.lng}</td>
            <td><span class="status-badge ${location.status === 'active' ? 'status-active' : 'status-normal'}">
                ${location.status === 'active' ? '✅ Hoạt động' : '⏸️ Tạm ẩn'}
            </span></td>
            <td class="action-buttons">
                <button class="btn-edit" onclick="editLocation(${location.id})">✏️ Sửa</button>
                <button class="btn-delete" onclick="deleteLocation(${location.id})">🗑️ Xóa</button>
            </td>
        `;
    });
}

function openModal() {
    editingId = null;
    document.getElementById('modalTitle').textContent = 'Thêm địa điểm mới';
    document.getElementById('locationForm').reset();
    document.getElementById('imagePreview').style.display = 'none';
    document.getElementById('locationModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('locationModal').style.display = 'none';
}

function previewImage() {
    const url = document.getElementById('locationImage').value;
    const preview = document.getElementById('imagePreview');
    if (url) {
        preview.src = url;
        preview.style.display = 'block';
        preview.onerror = function() {
            alert('⚠️ URL ảnh không hợp lệ hoặc không thể tải được!');
            preview.style.display = 'none';
        };
    } else {
        preview.style.display = 'none';
    }
}

document.getElementById('locationForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const locationData = {
        id: editingId || Date.now(),
        name: document.getElementById('locationName').value,
        city: document.getElementById('locationCity').value,
        description: document.getElementById('locationDescription').value,
        lat: parseFloat(document.getElementById('locationLat').value),
        lng: parseFloat(document.getElementById('locationLng').value),
        image: document.getElementById('locationImage').value,
        status: document.getElementById('locationStatus').value
    };

    const adminData = JSON.parse(localStorage.getItem('adminData'));
    
    if (editingId) {
        const index = adminData.locations.findIndex(l => l.id === editingId);
        adminData.locations[index] = locationData;
        alert('✅ Cập nhật địa điểm thành công!');
    } else {
        adminData.locations.push(locationData);
        alert('✅ Thêm địa điểm thành công!');
    }

    localStorage.setItem('adminData', JSON.stringify(adminData));
    loadLocations();
    closeModal();
});

function editLocation(id) {
    editingId = id;
    const location = locations.find(l => l.id === id);
    
    document.getElementById('modalTitle').textContent = 'Chỉnh sửa địa điểm';
    document.getElementById('locationName').value = location.name;
    document.getElementById('locationCity').value = location.city;
    document.getElementById('locationDescription').value = location.description || '';
    document.getElementById('locationLat').value = location.lat;
    document.getElementById('locationLng').value = location.lng;
    document.getElementById('locationImage').value = location.image || '';
    document.getElementById('locationStatus').value = location.status;
    
    if (location.image) {
        document.getElementById('imagePreview').src = location.image;
        document.getElementById('imagePreview').style.display = 'block';
    }
    
    document.getElementById('locationModal').style.display = 'block';
}

function deleteLocation(id) {
    if (confirm('⚠️ Bạn có chắc muốn xóa địa điểm này không? Hành động này không thể hoàn tác!')) {
        const adminData = JSON.parse(localStorage.getItem('adminData'));
        adminData.locations = adminData.locations.filter(l => l.id !== id);
        localStorage.setItem('adminData', JSON.stringify(adminData));
        loadLocations();
        alert('✅ Xóa địa điểm thành công!');
    }
}

function searchLocations() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    locations = adminData.locations.filter(l => 
        l.name.toLowerCase().includes(searchTerm) || 
        l.city.toLowerCase().includes(searchTerm) ||
        (l.description && l.description.toLowerCase().includes(searchTerm))
    );
    renderLocations();
}

document.getElementById('logoutBtn').addEventListener('click', function(e) {
    e.preventDefault();
    if (confirm('Bạn có chắc muốn đăng xuất?')) {
        localStorage.removeItem('isAdminLoggedIn');
        window.location.href = '/';
    }
});

window.onclick = function(event) {
    if (event.target === document.getElementById('locationModal')) {
        closeModal();
    }
};

loadLocations();
