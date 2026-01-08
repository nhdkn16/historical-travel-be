const currentUserId = document.body.dataset.userId;

document.querySelectorAll(".comment-form").forEach(form => {
    form.addEventListener("submit", async e => {
        e.preventDefault();

        const postId = form.dataset.postId;
        const input = form.querySelector(".comment-input");
        const content = input.value.trim();
        if (!content) return;

        const res = await fetch("/comments/add2", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({ postId, content })
        });

        const data = await res.json();

        const list = form
            .closest(".comments-section")
            .querySelector(".comments-list");

        list.appendChild(renderComment(c));

        const countSpan = form
            .closest(".post-card")
            .querySelector(".comment-count");

        countSpan.textContent = parseInt(countSpan.textContent) + 1;

        input.value = "";
    });
});

document.querySelectorAll(".comment-btn").forEach(btn => {
    btn.addEventListener("click", async () => {
        const postId = btn.dataset.postId;
        const section = document.querySelector(
            `.comments-section[data-post-id="${postId}"]`
        );
        const list = section.querySelector(".comments-list");

        if (section.style.display === "block") {
            section.style.display = "none";
            return;
        }

        section.style.display = "block";

        if (list.dataset.loaded === "true") return;

        const res = await fetch(`/comments/${postId}`);
        const comments = await res.json();

        list.innerHTML = "";

        comments.forEach(c => {
            list.appendChild(renderComment(c));
        });

        list.dataset.loaded = "true";
    });
});

function renderComment(c) {
    const div = document.createElement("div");
    div.className = "comment-item";
    div.dataset.id = c.commentId;

    let actions = "";
    if (currentUserId && c.userId == currentUserId) {
        actions = `
            <button class="edit-comment">Sửa</button>
            <button class="delete-comment">Xóa</button>
        `;
    }

    div.innerHTML = `
        <strong>${c.username}:</strong>
        <span class="comment-content">${c.content}</span>
        ${actions}
    `;
    return div;
}

document.addEventListener("click", async e => {
    if (e.target.classList.contains("edit-comment")) {
        const item = e.target.closest(".comment-item");
        const span = item.querySelector(".comment-content");
        const oldContent = span.textContent;

        const newContent = prompt("Sửa bình luận:", oldContent);
        if (!newContent) return;

        const res = await fetch("/comments/edit", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({
                commentId: item.dataset.id,
                content: newContent
            })
        });

        const data = await res.json();
        span.textContent = data.content;
    }
});

document.addEventListener("click", async e => {
    if (e.target.classList.contains("delete-comment")) {
        if (!confirm("Xóa bình luận này?")) return;

        const item = e.target.closest(".comment-item");

        await fetch("/comments/delete", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({
                commentId: item.dataset.id
            })
        });

        item.remove();
    }
});
