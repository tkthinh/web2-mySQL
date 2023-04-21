const express = require('express');

const imageUploadMiddleware = require('../middlewares/image-upload');

const adminController = require('../controllers/admin-controller');
const imageUpload = require('../middlewares/image-upload');

const router = express.Router();

router.get('/', adminController.getDashboard);

router.get('/customers', adminController.getCustomer);

router.get('/orders', adminController.getOrder);

//PRODUCT

router.get('/products', adminController.getProducts);

router.post(
  '/products',
  imageUpload.fields([{ name: 'thumbnail' }, { name: 'hero' }]),
  adminController.createNewProduct
);

router.get('/products/:id', adminController.getUpdateProduct);

router.post(
  '/products/:id',
  imageUpload.fields([{ name: 'thumbnail' }, { name: 'hero' }]),
  adminController.updateProduct
);

router.delete('/products/:id', adminController.deleteProduct);

//PRODUCT VARIANT

router.get('/products/variant/:id', adminController.getVariants);

router.post(
  '/products/variant/:id',
  imageUploadMiddleware.single('image'),
  adminController.createNewVariant
);

router.get(
  '/products/variant/:id/update/:vid',
  adminController.getUpdateVariant
);

router.post(
  '/products/variant/:id/update/:vid',
  imageUploadMiddleware.single('image'),
  adminController.updateVariant
);

router.delete('/products/variant/:id/:vid', adminController.deleteVariant);

router.get('/auth', adminController.getAuth);

module.exports = router;
