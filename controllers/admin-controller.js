const Product = require('../models/product-model');

function getDashboard(req, res) {
  res.render('admin/dashboard');
}

function getCustomer(req, res) {
  res.render('admin/customers');
}

function getOrder(req, res) {
  res.render('admin/orders');
}

async function getProducts(req, res, next) {
  try {
    const products = await Product.findAll();
    res.render('admin/products', { products: products });
  } catch (error) {
    next(error);
    return;
  }
}

async function createNewProduct(req, res, next) {
  const product = new Product(
    '',
    req.body.name,
    req.body.type,
    req.body.price,
    req.body.stock,
    req.file.filename
  );

  try {
    await product.save();
  } catch (error) {
    next(error);
    return;
  }

  res.redirect('/admin/products');
}

async function getUpdateProduct(req, res, next) {
  try {
    const product = await Product.findById(req.params.id);
    res.render('admin/includes/update-form', { product: product });
  } catch (error) {
    next(error);
    return;
  }
}

async function updateProduct(req, res, next) {
  const product = new Product(
    req.params.id,
    req.body.name,
    req.body.type,
    req.body.price,
    req.body.stock,
  )

  if (req.file) {
    product.replaceThumbnail(req.file.filename);
  }
  try {
    await product.save();
  } catch (error) {
    next(error);
    return;
  }

  res.redirect('/admin/products');
}

async function deleteProduct(req, res, next) {
  let product;
  try {
    product = await Product.findById(req.params.id);
    await product.delete();
  } catch (error) {
    next(error);
    return;
  }
  res.json({message: 'Đã xoá sản phẩm!'})
}

function getAuth(req, res) {
  res.render('admin/auth');
}

module.exports = {
  getDashboard: getDashboard,
  getCustomer: getCustomer,
  getProducts: getProducts,
  getUpdateProduct: getUpdateProduct,
  updateProduct: updateProduct,
  deleteProduct: deleteProduct,
  getOrder: getOrder,
  createNewProduct: createNewProduct,
  getAuth: getAuth,
};
