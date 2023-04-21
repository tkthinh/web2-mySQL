const db = require('../database/database');

const namingProduct = require('../util/product-naming')

class ProductVariant {
  constructor(MaSP, MaDSP, TenMau, Kho, Image) {
    this.MaSP = MaSP;
    this.MaDSP = MaDSP;
    this.TenMau = TenMau;
    this.Kho = +Kho;
    this.Image = Image; // name of img file
    this.updateImageData();
  }

  static async findById(id) {
    const [results] = await db.query(
      'SELECT * FROM san_pham WHERE MaSP = ? LIMIT 1',
      [id]
    );

    if (!results[0]) {
      const error = new Error('Không tìm thấy sản phẩm!');
      error.code = 404;
      throw error;
    }

    const product = results[0];
    return new ProductVariant(
      product.MaSP,
      product.MaDSP,
      product.TenMau,
      product.Kho,
      product.Image
    );
  }

  static async findAll() {
    let result = await db.query('SELECT * FROM san_pham');
    const products = result[0];

    return products.map(function (prod) {
      return new ProductVariant(prod.MaSP, prod.MaDSP, prod.TenMau, prod.Kho, prod.Image);
    });
  }

  updateImageData() {
    this.ImagePath = `product-data/img/${this.Image}`;
    this.ImageUrl = `/products/assets/img/${this.Image}`;
  }

  async save() {
    const productData = {
      MaSP: this.MaSP,
      MaDSP: this.MaDSP,
      TenMau: this.TenMau,
      Kho: this.Kho,
      Image: this.Image
    };
    // Neu co ma SP thi cap nhat san pham
    if (this.MaSP) {
      if (!this.Image) {
        // th khong cap nhat anh sp
        delete productData.Image;
        await db.query(
          'UPDATE san_pham SET MaSP= ?, TenMau= ?, Kho= ?  WHERE MaSP = ?',
          [
            productData.MaDSP + namingProduct(productData.TenMau),
            productData.TenMau,
            productData.Kho,
            this.MaSP,
          ]
        );
      } else
        await db.query(
          // th co cap nhat anh sp
          'UPDATE san_pham SET MaSP= ?, TenMau = ?, Kho = ?, Image =? WHERE MaSP = ?',
          [
            productData.MaDSP + namingProduct(productData.TenMau),
            productData.TenMau,
            productData.Kho,
            productData.Image,
            this.MaSP,
          ]
        );
    } else {
      // Khong thi tao sp moi
      await db.query(
        'INSERT INTO san_pham (MaSP, MaDSP, TenMau, Kho, Image) VALUES (?, ?, ?, ?, ?)',
        [
          productData.MaDSP + namingProduct(productData.TenMau),
          productData.MaDSP,
          productData.TenMau,
          productData.Kho,
          productData.Image,
        ]
      );
    }
  }

  async replaceImage(newImage) {
    this.Image = newImage;
    this.updateImageData();
  }

  delete() {
    return db.query('DELETE FROM san_pham WHERE MaSP = ?', this.MaSP);
  }
}
module.exports = ProductVariant;
