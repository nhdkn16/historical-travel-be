function openModal() {
    editingId = null;
    document.getElementById('modalTitle').textContent = 'Thêm người dùng mới';
    document.getElementById('userForm').reset();
    document.getElementById('password').required = true;
    document.getElementById('passwordNote').textContent = '(Bắt buộc)';
    document.getElementById('password').placeholder = 'Nhập mật khẩu';
    document.getElementById('userModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('userModal').style.display = 'none';
}

window.onclick = function(event) {
    if (event.target === document.getElementById('userModal')) closeModal();
};
