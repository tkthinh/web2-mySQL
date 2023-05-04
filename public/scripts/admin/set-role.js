const roleForms = document.querySelectorAll('.auth-role');

async function setRole(event) {
  const userID = event.target.dataset.userid;
  const role = event.target.value;

  let response;
  try {
    response = await fetch('/admin/auth/' + userID, {
      method: 'PATCH',
      body: JSON.stringify({
        role: role,
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

  alert('Đã cập nhật quyền cho người dùng!');
}

roleForms.forEach(function (statusForm) {
  statusForm.addEventListener('change', setRole);
});
