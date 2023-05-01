const statusForms = document.querySelectorAll('.order-state');

async function updateOrder(event) {
  const orderID = event.target.dataset.orderid;
  const status = event.target.value;

  let response;
  try {
    response = await fetch('/admin/orders/' + orderID, {
      method: 'PATCH',
      body: JSON.stringify({
        status: status,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    });
  } catch (error) {
    alert('Có lỗi đã xảy ra!');
    return;
  }

  if (!response.ok) {
    alert('Có lỗi đã xảy ra');
    return;
  }

  alert('Đã cập nhật trạng thái đơn hàng!');
  event.target.outerHTML = `<p>${status}</p>`;
}

statusForms.forEach(function (statusForm) {
  statusForm.addEventListener('change', updateOrder);
});
