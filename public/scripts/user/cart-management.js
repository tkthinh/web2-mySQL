const addToCartBtn = document.querySelector('#add-btn')
const cartCounter = document.querySelector('#cart-counter')

async function addToCart() {
  const productId = addToCartBtn.dataset.productId;
  let response;
  try {
      response = await fetch('/cart/items', {
      method: 'POST',
      body: JSON.stringify({
        MaSP: productId
      }),
      headers: {
        'Content-Type': 'application/json'
      }
    });
  } catch(error) {
    alert('Có lỗi đã xảy ra')
  }

  if(!response.ok) {
    alert('Có lỗi đã xảy ra')
  }

  const responseData = await response.json();

  const newTotalQuantity = responseData.newTotalQuantity;

  cartCounter.textContent = newTotalQuantity;
}

addToCartBtn.addEventListener('click', addToCart)