const ProductVariant = require('../models/product-variant-model');

function getCart(req, res) {
  res.render('user/cart/cart');
}

async function addCartItem(req, res, next) {
  let product;
  try {
    product = await ProductVariant.findById(req.body.MaSP);
    product.TenDSP = (await ProductVariant.getData(product.MaDSP)).TenDSP;
    product.Gia = (await ProductVariant.getData(product.MaDSP)).Gia;
  } catch (error) {
    next(error);
    return;
  }

  const cart = res.locals.cart;
  cart.addItem(product);
  req.session.cart = cart;

  res.status(201).json({
    message: 'Đã thêm vào giỏ hàng',
    newTotalItems: cart.totalQuantity,
  });
}

function updateCartItem(req, res) {
  const cart = res.locals.cart;

  const updatedItemData = cart.updateItem(
    req.body.productId,
    req.body.quantity
  );

  req.session.cart = cart;

  res.json({
    message: 'Đã cập nhật giỏ hàng',
    updatedCartData: {
      newTotalQuantity: cart.totalQuantity,
      newTotalPrice: cart.totalPrice,
      updatedItemPrice: updatedItemData.updatedItemPrice,
    },
  });
}

module.exports = {
  getCart: getCart,
  addCartItem: addCartItem,
  updateCartItem: updateCartItem,
};
