const addBtn = document.getElementById('add-btn');
const cancelBtns = document.querySelectorAll('.cancel-btn');

const productForm = document.getElementById('product-form');
const backdrop = document.getElementById('backdrop');

addBtn.addEventListener('click', function () {
  productForm.classList.remove('hidden');
  backdrop.classList.remove('hidden');
});

cancelBtns.forEach(function(btn) {
  btn.addEventListener('click', function () {
    productForm.classList.add('hidden');
    backdrop.classList.add('hidden');
  });
});

// AJAX

const urlPath = window.location.pathname;

async function deleteProduct(event) {
  const buttonClicked = event.target;
  const productId = buttonClicked.dataset.productid;
  let response;

  if(!urlPath.includes('variant')){
    response = await fetch('/admin/products/' + productId, {
        method: 'DELETE'
      });
  } else {
    response = await fetch('/admin/products/variant/' + productId, {
      method: 'DELETE'
    });
  }

  if(!response.ok) {
    alert('Có lỗi đã xảy ra!');
    return;
  }

  buttonClicked.parentElement.parentElement.parentElement.remove();
}

const deleleProductButtons = document.querySelectorAll('.tcontent button');

for(const deleleProductButton of deleleProductButtons) {
  deleleProductButton.addEventListener('click', deleteProduct)
}