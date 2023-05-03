const express = require('express');

const productController = require('../controllers/product-controller')

const router = express.Router();

router.get('/products', productController.getProducts);

router.get('/products/search', productController.searchProduct);

router.get('/products/:id', productController.getProductDetail);

module.exports = router;
