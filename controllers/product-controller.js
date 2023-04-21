const Product = require('../models/product-model');

function getLandingPage(req, res) {
  res.render('user/products/index');
}

async function getProducts(req, res, next) {
  try {
    const products = await Product.findAll();
    res.render('user/products/products', { products: products });
  } catch (error) {
    next(error);
  }
}

async function getProductDetail(req, res, next) {
  try {
    const product = await Product.findById(req.params.id);
    res.render('user/products/product-detail', { product: product });
  } catch (error) {
    next(error);
  }
}

module.exports = {
  getLandingPage: getLandingPage,
  getProducts: getProducts,
  getProductDetail: getProductDetail,
};
