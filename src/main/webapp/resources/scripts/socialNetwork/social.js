class SocialHub {
    constructor() {
        this.currentUser = 'Anh Developer';
        this.posts = [];
        this.currentChat = null;
        this.socket = io('https://your-socket-server.com'); // Thay bằng server của bạn
        
        this.init();
    }

    init() {
        this.bindEvents();
        this.loadSamplePosts();
        this.showNotification('Chào mừng đến với Cộng đồng! 🚀', 3000);
    }

    bindEvents() {
        // Sidebar navigation
        document.querySelectorAll('.sidebar-item').forEach(item => {
            item.addEventListener('click', (e) => {
                document.querySelectorAll('.sidebar-item').forEach(i => i.classList.remove('active'));
                e.currentTarget.classList.add('active');
                
                const section = e.currentTarget.dataset.section;
                this.handleSectionSwitch(section);
            });
        });

        // Sidebar toggle
        const sidebar = document.getElementById('sidebar');
        sidebar.addEventListener('mouseenter', () => {
            sidebar.classList.add('expanded');
        });

        sidebar.addEventListener('mouseleave', () => {
            sidebar.classList.remove('expanded');
        });

        // Post creation
        document.getElementById('postBtn').addEventListener('click', () => this.createPost());
        document.getElementById('postTextarea').addEventListener('keydown', (e) => {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                this.createPost();
            }
        });

        // Chat
        document.querySelector('[data-section="chat"]').addEventListener('click', () => {
            document.getElementById('chatPanel').classList.add('open');
        });

        document.getElementById('closeChat').addEventListener('click', () => {
            document.getElementById('chatPanel').classList.remove('open');
        });

        document.getElementById('sendBtn').addEventListener('click', () => this.sendMessage());
        document.getElementById('chatInput').addEventListener('keydown', (e) => {
            if (e.key === 'Enter') {
                this.sendMessage();
            }
        });

        // Socket events
        this.socket.on('newMessage', (message) => {
            this.addMessageToChat(message);
        });

        // Global comment handling
        document.addEventListener('click', (e) => {
            if (e.target.closest('.comment-input input')) {
                const input = e.target.closest('.comment-input input');
                input.addEventListener('keydown', (ev) => {
                    if (ev.key === 'Enter') {
                        this.addComment(parseInt(input.dataset.postId), input.value);
                        input.value = '';
                    }
                });
            }
        });
    }

    handleSectionSwitch(section) {
        if (section === 'chat') {
            document.getElementById('chatPanel').classList.add('open');
        }
    }

    createPost() {
        const textarea = document.getElementById('postTextarea');
        const content = textarea.value.trim();
        
        if (!content) return;

        const post = {
            id: Date.now(),
            author: this.currentUser,
            avatar: 'A',
            content: content,
            time: new Date().toLocaleString('vi-VN'),
            likes: 0,
            liked: false,
            comments: [],
            shares: 0
        };

        this.posts.unshift(post);
        this.renderPosts();
        textarea.value = '';
        
        this.showNotification('Bài viết đã được đăng thành công! 🎉');
    }

    loadSamplePosts() {
        this.posts = [
            {
                id: 1,
                author: 'Bình ',
                avatar: 'B',
                content: 'Nay mình đi nghỉ mát ở Phú Quốc,Phú Quốc có đẹp không mọi người 😎',
                time: '10:30 22/10/2025',
                likes: 12,
                liked: false,
                comments: [
                    { author: 'Lan ', avatar: 'L', content: 'Đẹp quá anh ơi! 👏', time: '10:32' },
                    { author: 'Hùng ', avatar: 'H', content: 'Trời hôm nay thật dễ chịu😄', time: '10:35' }
                ],
                shares: 3
            },
            {
                id: 2,
                author: 'Lan ',
                avatar: 'L',
                content: 'Bạn có thể tham gia vào chuyến đi ở Nha Trang để có thể ngắm vùng biển tuyệt đẹp này',
                time: '09:15 22/10/2025',
                likes: 25,
                liked: true,
                comments: [
                    { author: this.currentUser, avatar: 'A', content: 'Đẹp lắm bạn mình sẽ đăng ký!', time: '09:20' }
                ],
                shares: 8
            }
        ];
        this.renderPosts();
    }

    renderPosts() {
        const feed = document.getElementById('postsFeed');
        feed.innerHTML = '';

        this.posts.forEach(post => {
            const postEl = this.createPostElement(post);
            feed.appendChild(postEl);
        });
    }

    createPostElement(post) {
        const postEl = document.createElement('div');
        postEl.className = 'post';
        postEl.innerHTML = `
            <div class="post-header">
                <div class="avatar-small">${post.avatar}</div>
                <div>
                    <div class="post-author">${post.author}</div>
                    <div class="post-time">${post.time}</div>
                </div>
            </div>
            <div class="post-content">${post.content}</div>
            <div class="post-actions-bar">
                <button class="action-btn ${post.liked ? 'liked' : ''}" data-action="like" data-post-id="${post.id}">
                    <span>❤️</span> <span>${post.likes}</span>
                </button>
                <button class="action-btn" data-action="comment" data-post-id="${post.id}">
                    <span>💬</span> <span>${post.comments.length}</span>
                </button>
                <button class="action-btn" data-action="share" data-post-id="${post.id}">
                    <span>🔄</span> <span>${post.shares}</span>
                </button>
            </div>
            ${post.comments.length > 0 ? `
                <div class="comments-section">
                    ${post.comments.map(comment => `
                        <div class="comment">
                            <div class="comment-avatar">${comment.avatar}</div>
                            <div class="comment-content">
                                <div class="comment-author">${comment.author}</div>
                                <div class="comment-text">${comment.content}</div>
                            </div>
                        </div>
                    `).join('')}
                    <div class="comment-input">
                        <input type="text" placeholder="Viết bình luận..." data-post-id="${post.id}">
                        <button>💬</button>
                    </div>
                </div>
            ` : ''}
        `;

        // Bind post actions
        postEl.querySelectorAll('.action-btn').forEach(btn => {
            btn.addEventListener('click', (e) => this.handlePostAction(e));
        });

        // Bind comment input
        const commentInput = postEl.querySelector('.comment-input input');
        if (commentInput) {
            commentInput.addEventListener('keydown', (e) => {
                if (e.key === 'Enter') {
                    this.addComment(post.id, commentInput.value);
                    commentInput.value = '';
                }
            });
        }

        return postEl;
    }

    handlePostAction(e) {
        const btn = e.currentTarget;
        const postId = parseInt(btn.dataset.postId);
        const action = btn.dataset.action;

        const postIndex = this.posts.findIndex(p => p.id === postId);
        const post = this.posts[postIndex];

        if (action === 'like') {
            post.liked = !post.liked;
            post.likes += post.liked ? 1 : -1;
        } else if (action === 'share') {
            post.shares++;
            this.showNotification('Đã chia sẻ bài viết!');
        }

        this.renderPosts();
    }

    addComment(postId, content) {
        if (!content.trim()) return;

        const postIndex = this.posts.findIndex(p => p.id === postId);
        this.posts[postIndex].comments.push({
            author: this.currentUser,
            avatar: 'A',
            content: content.trim(),
            time: new Date().toLocaleTimeString('vi-VN', {hour: '2-digit', minute: '2-digit'})
        });

        this.renderPosts();
    }

    sendMessage() {
        const input = document.getElementById('chatInput');
        const message = input.value.trim();
        
        if (!message) return;

        const messageData = {
            content: message,
            author: this.currentUser,
            avatar: 'A',
            isOwn: true,
            timestamp: new Date()
        };

        this.addMessageToChat(messageData);
        input.value = '';

        // Send to server
        this.socket.emit('sendMessage', messageData);
    }

    addMessageToChat(message) {
        const messagesContainer = document.getElementById('chatMessages');
        const messageEl = document.createElement('div');
        messageEl.className = `message ${message.isOwn ? 'own' : 'other'}`;
        messageEl.innerHTML = `
            <div class="message-bubble">${message.content}</div>
        `;
        messagesContainer.appendChild(messageEl);
        messagesContainer.scrollTop = messagesContainer.scrollHeight;
    }

    showNotification(message, duration = 2000) {
        const notification = document.getElementById('notification');
        notification.textContent = message;
        notification.classList.add('show');
        
        setTimeout(() => {
            notification.classList.remove('show');
        }, duration);
    }
}

// Initialize app
document.addEventListener('DOMContentLoaded', () => {
    new SocialHub();
});