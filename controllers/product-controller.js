const e = require('express');
const Product = require('../models/product-model');
const ProductVariant = require('../models/product-variant-model');

function getLandingPage(req, res) {
  res.render('user/products/index');
}

async function searchProduct(req, res, next) {
  const name = req.query.name || '%';
  const productType = req.query.type || '%';
  const price = {};
  price.min = req.query.minPrice || 0;
  price.max = req.query.maxPrice || Number.MAX_VALUE;
  const engine = {};
  engine.start = req.query.engineStart || 0;
  engine.end = req.query.engineEnd || Number.MAX_VALUE;

  try{
    const products = await Product.searchProduct(name, productType, price, engine);
    res.render('user/products/results', {products: products});
  } catch (error) {
    next(error);
    return;
  }
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
  searchProduct: searchProduct,
};
