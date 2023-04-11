const chartConfig = {
  type: 'doughnut',
  data: {
    datasets: [
      {
        label: 'Đã bán',
        data: [57, 44, 21, 4],
        backgroundColor: ['#ef4444', '#f59e0b', '#84cc16', '#8b5cf6'],
      },
    ],
    labels: ['Xe số', 'Xe tay ga', 'Xe tay côn', 'Phân khối lớn'],
  },
  options: {
    responsive: true,
    cutoutPercentage: 80,
    plugins:{
      legend: {
        display: false,
      }
    },
    cutout: '60%'
  },
}

const sellChart = document.getElementById('sellChart')
window.myPie = new Chart(sellChart, chartConfig)
