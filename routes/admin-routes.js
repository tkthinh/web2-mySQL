const express = require('express');
const db = require('../database/database');

const imageUploadMiddleware = require('../middlewares/image-upload');

const adminController = require('../controllers/admin-controller');
const imageUpload = require('../middlewares/image-upload');

const router = express.Router();

router.get('/', async function (req, res) {
  const [khachHang] = await db.query(
    'SELECT COUNT(IDTaiKhoan) as KhachHang FROM tai_khoan'
  );
  const [donHang] = await db.query(
    'SELECT COUNT(MaDH) as DonHang FROM don_hang'
  );
  const [sanpham] = await db.query(
    'SELECT COUNT(MaDSP) as SanPham FROM dong_san_pham'
  );
  const [doanhthu] = await db.query(
    'SELECT SUM(TongTien) as DoanhThu FROM don_hang'
  );

  let [data, fields] = await db.query(`SELECT
  p.MaLoaiSP,
  COUNT(*) AS DaBan
  FROM
  dong_san_pham p
  INNER JOIN san_pham pv ON p.MaDSP = pv.MaDSP
  INNER JOIN ct_don_hang od ON pv.MaSP = od.MaSP
  GROUP BY
  p.MaLoaiSP;`);

  const daBan = {};
  daBan.XeSo = data[2].DaBan
  daBan.XeGa = data[0].DaBan
  daBan.XeTC = data[3].DaBan
  daBan.PKL = data[1].DaBan

  res.render('admin/dashboard', {
    khachHang: khachHang[0].KhachHang,
    donHang: donHang[0].DonHang,
    sanpham: sanpham[0].SanPham,
    doanhthu: +doanhthu[0].DoanhThu,
    daBan
  });
});

router.get('/customers', adminController.getCustomer);

// ORDER

router.get('/orders', adminController.getOrder);

router.get('/orders/search', adminController.searchOrder);

router.patch('/orders/:id', adminController.updateOrder);

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

router.patch('/auth/:id', adminController.setRole);

module.exports = router;
