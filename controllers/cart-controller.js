const Product = require('../models/product-model');

function getCart(req, res) {
  res.render('user/cart/cart')
}

async function addCartItem(req, res, next) {
  let product;
  try {
    product = await Product.findById(req.body.MaSP);
  } catch (error) {
    next(error);
    return;
  }

  const cart = res.locals.cart;
  cart.addItem();
  req.session.cart = cart;

  res.status(201).json({
    message: 'Đã thêm vào giỏ hàng',
    newTotalItems: cart.totalQuantity
  });
}

module.exports = {
  getCart: getCart,
  addCartItem: addCartItem,
};
