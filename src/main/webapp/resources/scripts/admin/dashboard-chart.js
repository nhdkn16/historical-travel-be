document.addEventListener("DOMContentLoaded", function () {

    const dataDiv = document.getElementById("dashboardChartData");
    if (!dataDiv) return;

    const labels = JSON.parse(dataDiv.dataset.labels);
    const values = JSON.parse(dataDiv.dataset.values);

    const ctx = document.getElementById("activityChart").getContext("2d");

    new Chart(ctx, {
        type: "bar",
        data: {
            labels: labels,
            datasets: [{
                label: "Thống kê hệ thống",
                data: values,
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
});
