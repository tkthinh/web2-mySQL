const imagePicker = document.querySelector('.thumbnail-uploader input');
const imagePreviewer = document.querySelector('.thumbnail-uploader img');

function updateImagePreview() {
  const files = imagePicker.files;

  if (!files || files.length === 0) {
    return;
  }

  const pickedFile = files[0];

  imagePreviewer.src = URL.createObjectURL(pickedFile);
  imagePreviewer.classList.remove('hidden');
}

imagePicker.addEventListener('change', updateImagePreview);
