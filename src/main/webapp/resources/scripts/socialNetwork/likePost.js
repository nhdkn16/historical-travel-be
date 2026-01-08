document.querySelectorAll(".like-btn").forEach(btn => {
    btn.addEventListener("click", async function () {

        const postId = btn.dataset.postId;
        const countSpan = btn.nextElementSibling;

        const res = await fetch("/social/like", {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams({
                postId: postId
            })
        });

        if (!res.ok) {
            alert("Bạn cần đăng nhập để thích bài viết");
            return;
        }

        const data = await res.json();

        countSpan.textContent = data.likeCount;

        if (data.liked) {
            btn.classList.add("liked");
        } else {
            btn.classList.remove("liked");
        }
    });
});
