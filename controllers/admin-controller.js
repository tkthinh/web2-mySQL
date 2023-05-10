const Product = require('../models/product-model');
const ProductVariant = require('../models/product-variant-model');
const Order = require('../models/order-model');
const User = require('../models/user-model');

function getDashboard(req, res) {
  res.render('admin/dashboard');
}

async function getCustomer(req, res) {
  const page = req.query.page || 1;
  const limit = 12;
  const offset = (page - 1) * limit;
  try {
    const users = await User.findAll(limit, offset);
    const userCount = await User.countUser();
    const totalPages = Math.ceil(userCount / limit);
    res.render('admin/customers', { users: users, page: page, totalPages: totalPages });
  } catch (error) {
    next(error);
    return;
  }
}

// ORDER

async function getOrder(req, res, next) {
  const page = req.query.page || 1;
  const limit = 6;
  const offset = (page - 1) * limit;

  try{
    const orders = await Order.findAllOrders(limit, offset);
    const orderCount = await Order.findAllOrders();
    const totalPages = Math.ceil(orderCount / limit);
    res.render('admin/orders', { orders: orders, page: page, totalPages: totalPages });
  } catch (error) {
    next(error);
  }
}

async function updateOrder(req, res, next) {
  try{
    const order = new Order('', '',req.body.status, '', req.params.id);
    await order.save();
  } catch (error) {
    next(error);
  }
  res.redirect('/admin/orders');
}

// PRODUCT

async function getProducts(req, res, next) {
  const page = req.query.page || 1;
  const limit = 6;
  const offset = (page - 1) * limit;
  try {
    const products = await Product.findAll(limit, offset);
    const engineType = await Product.getAllEngineType();
    const productCount = await Product.countProduct();
    const totalPages = Math.ceil(productCount / limit);
    res.render('admin/products', { products: products, engineType: engineType, page: page, totalPages: totalPages });
  } catch (error) {
    next(error);
    return;
  }
}

async function createNewProduct(req, res, next) {
  const ThongSoSP = {
    DungTich: req.body.ts1,
    CongSuatMax: req.body.ts2,
    MomenXoanMax: req.body.ts3,
    HTKhoiDong: req.body.ts4,
    ChieuCao: req.body.ts5,
    TrongLuong: req.body.ts6,
    BinhXang: req.body.ts7,
    MucTieuHao: req.body.ts8,
  }
  const product = new Product(
    '',
    req.body.name,
    req.body.type,
    req.body.price,
    req.body.engineType,
    req.body.engine,
    JSON.stringify(ThongSoSP),
    req.files.thumbnail[0].filename,
    req.files.hero[0].filename,
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
    const currentEngineType = await Product.getEngineTypeName(product.MaLoaiDongCo);
    const engineType = await Product.getAllEngineType();
    res.render('admin/includes/update-form', { product, currentEngineType, engineType });
  } catch (error) {
    next(error);
    return;
  }
}

async function updateProduct(req, res, next) {
  const ThongSoSP = {
    DungTich: req.body.ts1,
    CongSuatMax: req.body.ts2,
    MomenXoanMax: req.body.ts3,
    HTKhoiDong: req.body.ts4,
    ChieuCao: req.body.ts5,
    TrongLuong: req.body.ts6,
    BinhXang: req.body.ts7,
    MucTieuHao: req.body.ts8,
  }
  const product = new Product(
    req.params.id,
    req.body.name,
    req.body.type,
    req.body.price,
    req.body.engineType,
    req.body.engine,
    JSON.stringify(ThongSoSP)
  )

if (req.files) {
    product.updateImageData(req.files.filename);
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
  const variantStillExist = await ProductVariant.findAllVariant(req.params.id);
  if(variantStillExist.length > 0) {
    res.status(400).send('Không thể xoá dòng sản phẩm khi sản phẩm thuộc dòng còn tồn tại');
    return;
  }

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
    const productVariants = await ProductVariant.findAllVariant(req.params.id);
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

async function getAuth(req, res) {
  const page = req.query.page || 1;
  const limit = 12;
  const offset = (page - 1) * limit;
  try {
    const users = await User.findAll(limit, offset);
    const userCount = await User.countUser();
    const totalPages = Math.ceil(userCount / limit);
    res.render('admin/auth', { users: users, page: page, totalPages: totalPages });
  } catch (error) {
    next(error);
    return;
  }
}

async function setRole(req, res, next) {
  try{
    await User.setRole(req.params.id, req.body.role);
  } catch (error) {
    next(error);
  }
  res.redirect('/admin/auth');
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
  updateOrder: updateOrder,

  getAuth: getAuth,
  setRole: setRole
};
