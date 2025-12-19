let comments = [];

function loadComments() {
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    comments = adminData.comments || [];
    renderComments();
}

function renderComments() {
    const tbody = document.querySelector('#commentsTable tbody');
    tbody.innerHTML = '';
    document.getElementById('commentCount').textContent = comments.length;
    
    comments.forEach(comment => {
        const row = tbody.insertRow();
        const stars = '⭐'.repeat(comment.rating || 0);
        
        row.innerHTML = `
            <td>${comment.id}</td>
            <td><strong>${comment.user}</strong></td>
            <td class="comment-content" title="${comment.content}">${comment.content}</td>
            <td>${comment.target}<br><small style="color: #666;">(${comment.targetType === 'location' ? '📍 Địa điểm' : '📝 Bài viết'})</small></td>
            <td class="rating-stars">${stars}</td>
            <td>${comment.date}</td>
            <td><span class="status-badge ${
                comment.status === 'approved' ? 'status-active' : 
                comment.status === 'pending' ? 'status-pending' :
                comment.status === 'rejected' ? 'status-rejected' :
                'status-hidden'
            }">
                ${
                    comment.status === 'approved' ? '✅ Đã duyệt' :
                    comment.status === 'pending' ? '⏳ Chờ duyệt' :
                    comment.status === 'rejected' ? '❌ Từ chối' :
                    '👁️ Đã ẩn'
                }
            </span></td>
            <td class="action-buttons">
                <button class="btn-view" onclick="viewComment(${comment.id})" title="Xem chi tiết">👁️</button>
                ${comment.status !== 'approved' ? 
                    `<button class="btn-approve" onclick="approveComment(${comment.id})" title="Duyệt">✅</button>` : ''}
                ${comment.status === 'approved' ? 
                    `<button class="btn-hide" onclick="hideComment(${comment.id})" title="Ẩn">🙈</button>` : 
                    comment.status === 'hidden' ? 
                    `<button class="btn-show" onclick="showComment(${comment.id})" title="Hiện">👁️</button>` : ''}
                ${comment.status === 'pending' ? 
                    `<button class="btn-reject" onclick="rejectComment(${comment.id})" title="Từ chối">❌</button>` : ''}
                <button class="btn-delete" onclick="deleteComment(${comment.id})" title="Xóa">🗑️</button>
            </td>
        `;
    });
}

function viewComment(id) {
    const comment = comments.find(c => c.id === id);
    const stars = '⭐'.repeat(comment.rating || 0);
    
    document.getElementById('commentDetail').innerHTML = `
        <div class="meta">
            <p><strong>👤 Người dùng:</strong> ${comment.user}</p>
            <p><strong>📍 ${comment.targetType === 'location' ? 'Địa điểm' : 'Bài viết'}:</strong> ${comment.target}</p>
            <p><strong>⭐ Đánh giá:</strong> ${stars} (${comment.rating}/5)</p>
            <p><strong>📅 Ngày:</strong> ${comment.date}</p>
            <p><strong>📊 Trạng thái:</strong> <span class="status-badge ${
                comment.status === 'approved' ? 'status-active' : 
                comment.status === 'pending' ? 'status-pending' :
                comment.status === 'rejected' ? 'status-rejected' :
                'status-hidden'
            }">
                ${
                    comment.status === 'approved' ? '✅ Đã duyệt' :
                    comment.status === 'pending' ? '⏳ Chờ duyệt' :
                    comment.status === 'rejected' ? '❌ Từ chối' :
                    '👁️ Đã ẩn'
                }
            </span></p>
        </div>
        <p><strong>💬 Nội dung bình luận:</strong></p>
        <div class="content-box">${comment.content}</div>
    `;
    
    document.getElementById('commentModal').style.display = 'block';
}

function closeModal() {
    document.getElementById('commentModal').style.display = 'none';
}

function approveComment(id) {
    if (confirm('✅ Bạn có chắc muốn duyệt bình luận này?')) {
        updateCommentStatus(id, 'approved');
        alert('✅ Đã duyệt bình luận!');
    }
}

function rejectComment(id) {
    if (confirm('❌ Bạn có chắc muốn từ chối bình luận này?')) {
        updateCommentStatus(id, 'rejected');
        alert('❌ Đã từ chối bình luận!');
    }
}

function hideComment(id) {
    if (confirm('👁️ Bạn có chắc muốn ẩn bình luận này?')) {
        updateCommentStatus(id, 'hidden');
        alert('👁️ Đã ẩn bình luận!');
    }
}

function showComment(id) {
    if (confirm('✅ Bạn có chắc muốn hiển thị lại bình luận này?')) {
        updateCommentStatus(id, 'approved');
        alert('✅ Đã hiển thị bình luận!');
    }
}

function deleteComment(id) {
    if (confirm('⚠️ Bạn có chắc muốn xóa vĩnh viễn bình luận này? Hành động này không thể hoàn tác!')) {
        const adminData = JSON.parse(localStorage.getItem('adminData'));
        adminData.comments = adminData.comments.filter(c => c.id !== id);
        localStorage.setItem('adminData', JSON.stringify(adminData));
        loadComments();
        alert('🗑️ Đã xóa bình luận!');
    }
}

function updateCommentStatus(id, status) {
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    const comment = adminData.comments.find(c => c.id === id);
    comment.status = status;
    localStorage.setItem('adminData', JSON.stringify(adminData));
    loadComments();
}

function searchComments() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const statusFilter = document.getElementById('filterStatus').value;
    const ratingFilter = document.getElementById('filterRating').value;
    const adminData = JSON.parse(localStorage.getItem('adminData'));
    
    comments = adminData.comments.filter(c => {
        const matchSearch = c.content.toLowerCase().includes(searchTerm) || 
                            c.user.toLowerCase().includes(searchTerm) ||
                            c.target.toLowerCase().includes(searchTerm);
        const matchStatus = !statusFilter || c.status === statusFilter;
        const matchRating = !ratingFilter || c.rating === parseInt(ratingFilter);
        return matchSearch && matchStatus && matchRating;
    });
    
    renderComments();
}

document.getElementById('logoutBtn').addEventListener('click', function(e) {
    e.preventDefault();
    if (confirm('Bạn có chắc muốn đăng xuất?')) {
        localStorage.removeItem('isAdminLoggedIn');
        window.location.href = '/';
    }
});

window.onclick = function(event) {
    if (event.target === document.getElementById('commentModal')) {
        closeModal();
    }
};

loadComments();