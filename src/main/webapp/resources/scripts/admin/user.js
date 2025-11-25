if (localStorage.getItem('isAdminLoggedIn') !== 'true') {
    window.location.href = '/login';
}

let users = [];
let editingId = null;

function loadUsers() {
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    users = adminData.users || [];
    renderUsers();
}

function renderUsers() {
    const tbody = document.querySelector('#usersTable tbody');
    tbody.innerHTML = '';
    document.getElementById('userCount').textContent = users.length;
    
    users.forEach(user => {
        const row = tbody.insertRow();
        row.innerHTML = `
            <td>${user.id}</td>
            <td><strong>${user.username}</strong></td>
            <td>${user.email}</td>
            <td><span class="role-badge ${user.role === 'admin' ? 'role-admin' : 'role-user'}">
                ${user.role === 'admin' ? '👑 Admin' : '👤 User'}
            </span></td>
            <td><span class="status-badge ${user.status === 'active' ? 'status-active' : 'status-blocked'}">
                ${user.status === 'active' ? '✅ Hoạt động' : '🚫 Bị chặn'}
            </span></td>
            <td class="action-buttons">
                <button class="btn-edit" onclick="editUser(${user.id})">✏️ Sửa</button>
                ${user.status === 'active' ? 
                    `<button class="btn-block" onclick="blockUser(${user.id})">🚫 Chặn</button>` : 
                    `<button class="btn-unblock" onclick="unblockUser(${user.id})">✅ Mở</button>`
                }
                <button class="btn-role" onclick="toggleRole(${user.id})">🔄 Vai trò</button>
            </td>
        `;
    });
}

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

document.getElementById('userForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const userData = {
        id: editingId || Date.now(),
        username: document.getElementById('username').value,
        email: document.getElementById('email').value,
        password: document.getElementById('password').value || 'default123',
        fullname: document.getElementById('fullname').value,
        role: document.getElementById('role').value,
        status: document.getElementById('status').value,
        createdAt: new Date().toISOString().split('T')[0]
    };

    const adminData = JSON.parse(localStorage.getItem('adminData'));
    
    if (editingId) {
        const index = adminData.users.findIndex(u => u.id === editingId);
        if (!document.getElementById('password').value) {
            userData.password = adminData.users[index].password;
        }
        adminData.users[index] = userData;
        alert('✅ Cập nhật người dùng thành công!');
    } else {
        if (!userData.password || userData.password === 'default123') {
            alert('⚠️ Vui lòng nhập mật khẩu cho người dùng mới!');
            return;
        }
        adminData.users.push(userData);
        alert('✅ Thêm người dùng thành công!');
    }

    localStorage.setItem('adminData', JSON.stringify(adminData));
    loadUsers();
    closeModal();
});

function editUser(id) {
    editingId = id;
    const user = users.find(u => u.id === id);
    
    document.getElementById('modalTitle').textContent = 'Chỉnh sửa người dùng';
    document.getElementById('username').value = user.username;
    document.getElementById('email').value = user.email;
    document.getElementById('password').value = '';
    document.getElementById('password').required = false;
    document.getElementById('passwordNote').textContent = '(Để trống nếu không đổi)';
    document.getElementById('password').placeholder = 'Để trống nếu không đổi mật khẩu';
    document.getElementById('fullname').value = user.fullname || '';
    document.getElementById('role').value = user.role;
    document.getElementById('status').value = user.status;
    
    document.getElementById('userModal').style.display = 'block';
}

function blockUser(id) {
    if (confirm('⚠️ Bạn có chắc muốn chặn người dùng này?')) {
        updateUserStatus(id, 'blocked');
        alert('✅ Đã chặn người dùng!');
    }
}

function unblockUser(id) {
    if (confirm('Bạn có chắc muốn mở khóa người dùng này?')) {
        updateUserStatus(id, 'active');
        alert('✅ Đã mở khóa người dùng!');
    }
}

function toggleRole(id) {
    if (confirm('⚠️ Bạn có chắc muốn thay đổi vai trò của người dùng này?')) {
        const adminData = JSON.parse(localStorage.getItem('adminData'));
        const user = adminData.users.find(u => u.id === id);
        user.role = user.role === 'admin' ? 'user' : 'admin';
        localStorage.setItem('adminData', JSON.stringify(adminData));
        loadUsers();
        alert(`✅ Đã đổi vai trò thành ${user.role === 'admin' ? '👑 Admin' : '👤 User'}!`);
    }
}

function updateUserStatus(id, status) {
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    const user = adminData.users.find(u => u.id === id);
    user.status = status;
    localStorage.setItem('adminData', JSON.stringify(adminData));
    loadUsers();
}

function searchUsers() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const roleFilter = document.getElementById('filterRole').value;
    const statusFilter = document.getElementById('filterStatus').value;
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    
    users = adminData.users.filter(u => {
        const matchSearch = u.username.toLowerCase().includes(searchTerm) || 
                            u.email.toLowerCase().includes(searchTerm) ||
                            (u.fullname && u.fullname.toLowerCase().includes(searchTerm));
        const matchRole = !roleFilter || u.role === roleFilter;
        const matchStatus = !statusFilter || u.status === statusFilter;
        return matchSearch && matchRole && matchStatus;
    });
    renderUsers();
}

document.getElementById('logoutBtn').addEventListener('click', function(e) {
    e.preventDefault();
    if (confirm('Bạn có chắc muốn đăng xuất?')) {
        localStorage.removeItem('isAdminLoggedIn');
        window.location.href = '/';
    }
});

window.onclick = function(event) {
    if (event.target === document.getElementById('userModal')) closeModal();
};

loadUsers();
