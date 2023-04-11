const express = require('express');

const imageUploadMiddleware = require('../middlewares/image-upload');

const adminController = require('../controllers/admin-controller');

const router = express.Router();

router.get('/', adminController.getDashboard);

router.get('/customers', adminController.getCustomer);

router.get('/orders', adminController.getOrder);

router.get('/products', adminController.getProducts);

router.post(
  '/products',
  imageUploadMiddleware,
  adminController.createNewProduct
);

router.get('/products/:id', adminController.getUpdateProduct);

router.post('/products/:id', imageUploadMiddleware, adminController.updateProduct);

router.delete('/products/:id', adminController.deleteProduct);

router.get('/auth', adminController.getAuth);

module.exports = router;
