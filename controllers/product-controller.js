const Product = require('../models/product-model');
const ProductVariant = require('../models/product-variant-model');

function getLandingPage(req, res) {
  res.render('user/products/index');
}

async function getProducts(req, res, next) {
  const page = req.query.page || 1;
  const limit = 12;
  const offset = (page - 1) * limit;
  try {
    const products = await Product.findAll(limit, offset);
    const productCount = await Product.countProduct();
    const totalPages = Math.ceil(productCount / limit);
    res.render('user/products/products', { products: products, page: page, totalPages: totalPages });
  } catch (error) {
    next(error);
    return;
  }
}

async function getProductDetail(req, res, next) {
  try {
    const product = await Product.findById(req.params.id);
    const variants = await ProductVariant.getVariantData(req.params.id);
    res.render('user/products/product-detail', { product: product, variants: variants });
  } catch (error) {
    next(error);
    return;
  }
}

module.exports = {
  getLandingPage: getLandingPage,
  getProducts: getProducts,
  getProductDetail: getProductDetail,
};
