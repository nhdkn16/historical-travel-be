document.addEventListener('DOMContentLoaded', () => {

    const modal = document.getElementById('locationModal');
    const form = document.getElementById('locationForm');

    document.getElementById('btnAddLocation').addEventListener('click', () => {
        form.reset();
        document.getElementById('modalTitle').textContent = 'Thêm địa điểm mới';
        form.action = '/admin/location/create';
        modal.style.display = 'block';
    });

    document.getElementById('btnCloseModal').addEventListener('click', () => {
        modal.style.display = 'none';
    });

    document.querySelectorAll('.btn-edit').forEach(btn => {
        btn.addEventListener('click', () => {
            const d = btn.dataset;

            document.getElementById('modalTitle').textContent = 'Chỉnh sửa địa điểm';

            document.getElementById('locationId').value = d.id;
            document.getElementById('name').value = d.name;
            document.getElementById('description').value = d.desc || '';
            document.getElementById('address').value = d.address || '';
            document.getElementById('province').value = d.province || '';
            document.getElementById('type').value = d.type;
            document.getElementById('historicalPeriod').value = d.period || '';
            document.getElementById('latitude').value = d.lat;
            document.getElementById('longitude').value = d.lng;
            document.getElementById('mainImageUrl').value = d.image || '';
            document.getElementById('status').value = d.status;

            form.action = '/admin/location/update/' + d.id;
            modal.style.display = 'block';
        });
    });

});
