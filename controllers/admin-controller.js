const Product = require('../models/product-model');
const ProductVariant = require('../models/product-variant-model');

function getDashboard(req, res) {
  res.render('admin/dashboard');
}

function getCustomer(req, res) {
  res.render('admin/customers');
}

function getOrder(req, res) {
  res.render('admin/orders');
}

// PRODUCT

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
    req.body.engine,
    req.files.thumbnail[0].filename,
    req.files.hero[0].filename,
    {}
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

// PRODUCT VARIANT

async function getVariants(req, res, next) {
  try {
    const productVariants = await ProductVariant.findAll();
    res.render('admin/product-variant', { productVariants: productVariants, path: req.params.id });
  } catch (error) {
    next(error);
    return;
  }
}

async function createNewVariant(req, res, next) {
  const productVariant = new ProductVariant(
    '',
    req.params.id,
    req.body.name,
    req.body.stock,
    req.file.filename
  );

  try {
    await productVariant.save();
  } catch (error) {
    next(error);
    return;
  }

  res.redirect('/admin/products/variant/' + req.params.id);
}

async function getUpdateVariant(req, res, next) {
  try {
    const productVariant = await ProductVariant.findById(req.params.vid);
    res.render('admin/includes/update-variant-form', { productVariant: productVariant });
  } catch (error) {
    next(error);
    return;
  }
}

async function updateVariant(req, res, next) {
  const productVariant = new ProductVariant(
    req.params.vid,
    req.params.id,
    req.body.name,
    req.body.stock,
  )

  if (req.file) {
    productVariant.replaceImage(req.file.filename);
  }
  try {
    await productVariant.save();
  } catch (error) {
    next(error);
    return;
  }

  res.redirect('/admin/products/variant/'+ req.params.id);
}

async function deleteVariant(req, res, next) {
  let productVariant;
  try {
    productVariant = await ProductVariant.findById(req.params.vid);
    await productVariant.delete();
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
  createNewProduct: createNewProduct,
  getUpdateProduct: getUpdateProduct,
  updateProduct: updateProduct,
  deleteProduct: deleteProduct,

  getVariants: getVariants,
  createNewVariant: createNewVariant,
  getUpdateVariant: getUpdateVariant,
  updateVariant: updateVariant,
  deleteVariant: deleteVariant,

  getOrder: getOrder,
  getAuth: getAuth,
};
