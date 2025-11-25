// Form validation và submit handling
        const form = document.getElementById('contactForm');
        const submitBtn = document.getElementById('submitBtn');
        const successAlert = document.getElementById('successAlert');
        const errorAlert = document.getElementById('errorAlert');

        // Validate email
        function isValidEmail(email) {
            const regex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return regex.test(email);
        }

        // Validate form
        function validateForm() {
            let isValid = true;
            const formGroups = document.querySelectorAll('.form-group');

            formGroups.forEach(group => {
                const input = group.querySelector('input, textarea');
                group.classList.remove('error');

                if (!input.value.trim()) {
                    group.classList.add('error');
                    isValid = false;
                } else if (input.type === 'email' && !isValidEmail(input.value)) {
                    group.classList.add('error');
                    isValid = false;
                }
            });

            return isValid;
        }

        // Real-time validation
        document.querySelectorAll('input, textarea').forEach(input => {
            input.addEventListener('input', function() {
                const formGroup = this.closest('.form-group');
                formGroup.classList.remove('error');
            });
        });

        // Handle form submit
        form.addEventListener('submit', async function(e) {
            e.preventDefault();

            // Ẩn các alert cũ
            successAlert.classList.remove('show');
            errorAlert.classList.remove('show');

            // Validate
            if (!validateForm()) {
                return;
            }

            // Disable button và hiển thị loading
            submitBtn.disabled = true;
            submitBtn.innerHTML = `
                <div class="spinner"></div>
                <span>Đang gửi...</span>
            `;

            try {
                // Gửi form đến Formspree
                const formData = new FormData(form);
                const response = await fetch(form.action, {
                    method: 'POST',
                    body: formData,
                    headers: {
                        'Accept': 'application/json'
                    }
                });

                if (response.ok) {
                    // Thành công
                    successAlert.classList.add('show');
                    form.reset();
                    
                    // Scroll đến alert
                    successAlert.scrollIntoView({ behavior: 'smooth', block: 'center' });
                } else {
                    // Lỗi
                    errorAlert.classList.add('show');
                }
            } catch (error) {
                // Lỗi kết nối
                errorAlert.classList.add('show');
            } finally {
                // Reset button
                submitBtn.disabled = false;
                submitBtn.innerHTML = '<span class="btn-text">Gửi tin nhắn</span>';
            }
        });