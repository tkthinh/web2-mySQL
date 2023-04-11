const addBtn = document.getElementById('add-btn');
const cancelBtn = document.getElementById('cancel-btn');

const productForm = document.getElementById('product-form');
const backdrop = document.getElementById('backdrop');

addBtn.addEventListener('click', function () {
  productForm.classList.remove('hidden');
  backdrop.classList.remove('hidden');
});

cancelBtn.addEventListener('click', function () {
  productForm.classList.add('hidden');
  backdrop.classList.add('hidden');
});

// AJAX

async function deleteProduct(event) {
  const buttonClicked = event.target;
  const productId = buttonClicked.dataset.productid;

  const response = await fetch('/admin/products/' + productId, {
    method: 'DELETE'
  });

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

// let colorCount = 1;

// function addColorField() {
//   const colorContainer = document.querySelector('.colors-container');
//   let colorField = document.createElement('div');
//   colorField.className = 'flex justify-between';
//   colorField.innerHTML =
//    `
//     <input type="file" name="color${colorCount + 1}" accept="image/png" class="hidden" id="color${colorCount + 1}">
//     <label for="color${colorCount + 1}" class="img-upload-btn">Chọn ảnh</label>
//     <input type="text" placeholder="Tên màu">
//   `;
  
//   colorContainer.appendChild(colorField);
//   colorCount++;
// }

// let highlightCount = 1;

// function addHighlightField() {
//   const highlightContainer = document.querySelector('.highlights-container');
//   let highlightField = document.createElement('div');
//   highlightField.className = 'flex justify-between';
//   highlightField.innerHTML =
//    `
//    <input type="file" name="hightlight${highlightCount + 1}" accept="image/png, image/jpg" class="hidden" id="hightlight${highlightCount + 1}">
//    <label for="hightlight${highlightCount + 1}" class="img-upload-btn">Chọn ảnh</label>
//    <textarea name="hightlight${highlightCount + 1}-description" cols="25" rows="4" placeholder="Nhập tính năng nổi bật..."></textarea>
//   `;
  
//   highlightContainer.appendChild(highlightField);
//   highlightCount++;
// }