const url = window.location.pathname.split('/');
const path = url[url.length - 1];

let adminBtn = document.getElementById('admin');
let customerBtn = document.getElementById('customers');
let orderBtn = document.getElementById('orders');
let productBtn = document.getElementById('products');
let authBtn = document.getElementById('auth');

switch (path) {
  case 'admin':
    adminBtn.classList.replace('nav-links', 'nav-links-highlight');
    break;
  case 'customers':
    customerBtn.classList.replace('nav-links', 'nav-links-highlight');
    break;
  case 'orders':
    orderBtn.classList.replace('nav-links', 'nav-links-highlight');
    break;
  case 'products':
    productBtn.classList.replace('nav-links', 'nav-links-highlight');
    break;
  case 'auth':
    authBtn.classList.replace('nav-links', 'nav-links-highlight');
    break;
}

// if (path === 'customers') {
//   customerBtn.classList.replace('nav-links', 'nav-links-highlight');
//   adminBtn.classList.replace('nav-links-highlight', 'nav-links');
// } else if (path === 'orders') {
//   orderBtn.classList.replace('nav-links', 'nav-links-highlight');
//   adminBtn.classList.replace('nav-links-highlight', 'nav-links');
// } else if (path === 'products') {
//   productBtn.classList.replace('nav-links', 'nav-links-highlight');
//   adminBtn.classList.replace('nav-links-highlight', 'nav-links');
// } else if (path === 'auth') {
//   authBtn.classList.replace('nav-links', 'nav-links-highlight');
//   adminBtn.classList.replace('nav-links-highlight', 'nav-links');
// }
