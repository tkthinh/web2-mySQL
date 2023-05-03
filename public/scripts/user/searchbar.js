const searchBtn = document.getElementById('search-btn');
const backdrop = document.getElementById('backdrop');
const searchForm = document.getElementById('search-form');

function showForm() {
  backdrop.classList.remove('hidden');
  searchForm.classList.remove('hidden');
}

function hideForm(event){
  if(event.target !== searchForm) {
    backdrop.classList.add('hidden');
    searchForm.classList.add('hidden');
  }
}

searchBtn.addEventListener('click', showForm);
backdrop.addEventListener('click', hideForm);

const advancedCheck = document.getElementById('advanced-search-checkbox');
const advancedSearch = document.getElementById('advanced-search');

function showAdvancedSearch(){
  advancedSearch.classList.toggle('hidden');
}

advancedCheck.addEventListener('change', showAdvancedSearch);