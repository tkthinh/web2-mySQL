const thumbnailPicker = document.querySelector('.thumbnail-uploader input');
const thumbnailPreviewer = document.querySelector('.thumbnail-uploader img');

const heroPicker = document.querySelector('.hero-uploader input');
const heroPreviewer = document.querySelector('.hero-uploader img');

function updateThumbnailPreview() {
  const files = thumbnailPicker.files;

  if (!files || files.length === 0) {
    return;
  }

  const pickedFile = files[0];

  thumbnailPreviewer.src = URL.createObjectURL(pickedFile);
  thumbnailPreviewer.classList.remove('hidden');
}

function updateHeroPreview() {
  const files = heroPicker.files;

  if (!files || files.length === 0) {
    return;
  }

  const pickedFile = files[0];

  heroPreviewer.src = URL.createObjectURL(pickedFile);
  heroPreviewer.classList.remove('hidden');
}

thumbnailPicker.addEventListener('change', updateThumbnailPreview);
heroPicker.addEventListener('change', updateHeroPreview);
