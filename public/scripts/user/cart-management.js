const addToCartBtn = document.querySelector('#add-btn');
const cartCounter = document.querySelector('#cart-counter');

async function addToCart() {
  const colorChoice = document.querySelector('input[name="color"]:checked');
  if (!colorChoice){
    alert('Vui lòng chọn màu trước khi thêm vào giỏ!');
    return;
  }
  const productId = colorChoice.value;
  let response;
  try {
    response = await fetch('/cart/items', {
      method: 'POST',
      body: JSON.stringify({
        MaSP: productId,
      }),
      headers: {
        'Content-Type': 'application/json',
      },
    });
  } catch (error) {
    alert('Có lỗi đã xảy ra');
  }

  if (!response.ok) {
    alert('Có lỗi đã xảy ra');
    return;
  } else{
    alert('Đã thêm vào giỏ hàng!');
  }

  const responseData = await response.json();

  const newTotalQuantity = responseData.newTotalQuantity;

  cartCounter.textContent = newTotalQuantity;
}

addToCartBtn.addEventListener('click', addToCart);


const choices = document.querySelectorAll('input[name="color"]');
  const mainImage = document.querySelector('#main-img');

  function changeImage(e) {
    const request = e.target.dataset.image;
     mainImage.src = request;
  }

  choices.forEach(function (choice) {
    choice.addEventListener('click', changeImage);
  })