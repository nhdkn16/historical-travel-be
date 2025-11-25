if (localStorage.getItem('isAdminLoggedIn') !== 'true') {
    window.location.href = '/login';
}

let posts = [];
let editingId = null;

function loadPosts() {
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    posts = adminData.posts || [];
    renderPosts();
}

function renderPosts() {
    const tbody = document.querySelector('#postsTable tbody');
    tbody.innerHTML = '';
    document.getElementById('postCount').textContent = posts.length;
    
    posts.forEach(post => {
        const row = tbody.insertRow();
        row.innerHTML = `
            <td>${post.id}</td>
            <td><strong>${post.title}</strong></td>
            <td>${post.author}</td>
            <td>${post.date}</td>
            <td><span class="status-badge ${post.status === 'published' ? 'status-active' : 'status-normal'}">
                ${post.status === 'published' ? '✅ Đã xuất bản' : post.status === 'draft' ? '📝 Bản nháp' : '📦 Lưu trữ'}
            </span></td>
            <td class="action-buttons">
                <button class="btn-preview" onclick="previewPost(${post.id})">👁️ Xem</button>
                <button class="btn-edit" onclick="editPost(${post.id})">✏️ Sửa</button>
                <button class="btn-delete" onclick="deletePost(${post.id})">🗑️ Xóa</button>
            </td>
        `;
    });
}

function openModal() {
    editingId = null;
    document.getElementById('modalTitle').textContent = 'Thêm bài viết mới';
    document.getElementById('postForm').reset();
    document.getElementById('postModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('postModal').style.display = 'none';
}

function closePreview() {
    document.getElementById('previewModal').style.display = 'none';
}

document.getElementById('postForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    const postData = {
        id: editingId || Date.now(),
        title: document.getElementById('postTitle').value,
        summary: document.getElementById('postSummary').value,
        content: document.getElementById('postContent').value,
        image: document.getElementById('postImage').value,
        category: document.getElementById('postCategory').value,
        author: localStorage.getItem('adminUsername') || 'Admin',
        date: new Date().toISOString().split('T')[0],
        status: document.getElementById('postStatus').value
    };

    const adminData = JSON.parse(localStorage.getItem('adminData'));
    
    if (editingId) {
        const index = adminData.posts.findIndex(p => p.id === editingId);
        adminData.posts[index] = postData;
        alert('✅ Cập nhật bài viết thành công!');
    } else {
        adminData.posts.push(postData);
        alert('✅ Thêm bài viết thành công!');
    }

    localStorage.setItem('adminData', JSON.stringify(adminData));
    loadPosts();
    closeModal();
});

function editPost(id) {
    editingId = id;
    const post = posts.find(p => p.id === id);
    
    document.getElementById('modalTitle').textContent = 'Chỉnh sửa bài viết';
    document.getElementById('postTitle').value = post.title;
    document.getElementById('postSummary').value = post.summary || '';
    document.getElementById('postContent').value = post.content || '';
    document.getElementById('postImage').value = post.image || '';
    document.getElementById('postCategory').value = post.category || 'du-lich';
    document.getElementById('postStatus').value = post.status;
    
    document.getElementById('postModal').style.display = 'block';
}

function deletePost(id) {
    if (confirm('⚠️ Bạn có chắc muốn xóa bài viết này?')) {
        const adminData = JSON.parse(localStorage.getItem('adminData'));
        adminData.posts = adminData.posts.filter(p => p.id !== id);
        localStorage.setItem('adminData', JSON.stringify(adminData));
        loadPosts();
        alert('✅ Xóa bài viết thành công!');
    }
}

function previewPost(id) {
    const post = posts.find(p => p.id === id);
    document.getElementById('previewContent').innerHTML = `
        <h3>${post.title}</h3>
        <div class="meta">
            <strong>✍️ Tác giả:</strong> ${post.author} | 
            <strong>📅 Ngày:</strong> ${post.date} | 
            <strong>📂 Danh mục:</strong> ${post.category || 'N/A'}
        </div>
        ${post.image ? `<img src="${post.image}" alt="${post.title}">` : ''}
        ${post.summary ? `<p style="font-style: italic; color: #666;"><strong>Tóm tắt:</strong> ${post.summary}</p>` : ''}
        <hr style="margin: 20px 0; border: none; border-top: 1px solid #ddd;">
        <p style="white-space: pre-line; line-height: 1.8;">${post.content || 'Chưa có nội dung'}</p>
    `;
    document.getElementById('previewModal').style.display = 'block';
}

function searchPosts() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const statusFilter = document.getElementById('filterStatus').value;
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    
    posts = adminData.posts.filter(p => {
        const matchSearch = p.title.toLowerCase().includes(searchTerm) || 
                            (p.content && p.content.toLowerCase().includes(searchTerm));
        const matchStatus = !statusFilter || p.status === statusFilter;
        return matchSearch && matchStatus;
    });
    renderPosts();
}

document.getElementById('logoutBtn').addEventListener('click', function(e) {
    e.preventDefault();
    if (confirm('Bạn có chắc muốn đăng xuất?')) {
        localStorage.removeItem('isAdminLoggedIn');
        window.location.href = '/';
    }
});

window.onclick = function(event) {
    if (event.target === document.getElementById('postModal')) closeModal();
    if (event.target === document.getElementById('previewModal')) closePreview();
};

loadPosts();
