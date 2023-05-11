const ProductVariant = require('../models/product-variant-model');

function getCart(req, res) {
  res.render('user/cart/cart');
}

async function addCartItem(req, res, next) {
  let product;
  try {
    product = await ProductVariant.findById(req.body.MaSP);
    data = await ProductVariant.getData(product.MaDSP);
    product.TenDSP = data.TenDSP;
    product.Gia = data.Gia;
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

async function updateCartItem(req, res) {
  const cart = res.locals.cart;

  data = await ProductVariant.findById(req.body.productId);
  if (req.body.quantity > data.SoLuong) {
    res.json({
      error: 'Lỗi',
      message: 'Số lượng vượt quá mức quy định (Kho:' + data.SoLuong + ')' ,
      maxQuantity: data.SoLuong
    });
    return;
  }

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
