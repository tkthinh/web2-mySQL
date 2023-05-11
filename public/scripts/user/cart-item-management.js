const itemQuantityForms = document.querySelectorAll('.item-quantity');

async function updateCartItem(event) {
  event.preventDefault();

  const form = event.target;
  const productId = form.dataset.productid;
  const quantity = form.firstElementChild.value;

  let response;
  try {
    response = await fetch('/cart/items', {
      method: 'PATCH',
      body: JSON.stringify({
        productId: productId,
        quantity: quantity,
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
    alert('Có lỗi đã xảy ra!')
    return;
  }

  const responseData = await response.json();

  if(responseData.error) {
    alert(responseData.message);
    let resetQuantity = form.firstElementChild;
    resetQuantity.value = responseData.maxQuantity;
    return;
  }

  if(responseData.updatedCartData.updatedItemPrice === 0 ) {
    form.parentElement.parentElement.remove();
  } else {
      const cartItemTotalPrice = form.parentElement.parentElement.querySelector('.item-total-price');
      cartItemTotalPrice.textContent = responseData.updatedCartData.updatedItemPrice.toLocaleString('vi-VN');
    
      const cartTotalPrice = document.getElementById('cart-total');
      cartTotalPrice.textContent = responseData.updatedCartData.newTotalPrice.toLocaleString('vi-VN');
  }

  const cartCounter = document.getElementById('cart-counter');
  cartCounter.textContent = responseData.updatedCartData.newTotalQuantity;
}

for (const itemQuantityForm of itemQuantityForms) {
  itemQuantityForm.addEventListener('submit', updateCartItem);
}
