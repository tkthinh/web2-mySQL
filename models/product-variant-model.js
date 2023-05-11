const db = require('../database/database');

const namingProduct = require('../util/product-naming');

class ProductVariant {
  constructor(MaSP, MaDSP, TenMau, SoLuong, Image) {
    this.MaSP = MaSP;
    this.MaDSP = MaDSP;
    this.TenMau = TenMau;
    this.SoLuong = +SoLuong;
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
      product.SoLuong,
      product.Image
    );
  }

  static async findAllVariant(id) {
    let result = await db.query('SELECT * FROM san_pham WHERE MaDSP = ?', [id]);
    const products = result[0];

    return products.map(function (prod) {
      return new ProductVariant(
        prod.MaSP,
        prod.MaDSP,
        prod.TenMau,
        prod.SoLuong,
        prod.Image
      );
    });
  }

  static async getVariantData(id) {
    let result = await db.query(
      `
    SELECT MaSP, TenMau, SoLuong, Image FROM dong_san_pham
    INNER JOIN san_pham
    ON dong_san_pham.MaDSP = san_pham.MaDSP
    WHERE dong_san_pham.MaDSP = ?`,
      [id]
    );
    const products = result[0];
    return products.map(function (prod) {
      return new ProductVariant(
        prod.MaSP,
        id,
        prod.TenMau,
        prod.SoLuong,
        prod.Image,
      );
    });
  }

  static async getData(id) {
    let results = await db.query(
      `
      SELECT TenDSP, Gia FROM dong_san_pham
      WHERE MaDSP = ?`,
      [id]
    );
    const result = results[0];
    return {
      TenDSP: result[0].TenDSP,
      Gia: result[0].Gia,
    };
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
      SoLuong: this.SoLuong,
      Image: this.Image,
    };
    // Neu co ma SP thi cap nhat san pham
    if (this.MaSP) {
      if (!this.Image) {
        // th khong cap nhat anh sp
        delete productData.Image;
        await db.query(
          'UPDATE san_pham SET MaSP= ?, TenMau= ?, SoLuong= ?  WHERE MaSP = ?',
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
          'UPDATE san_pham SET MaSP= ?, TenMau = ?, SoLuong = ?, Image =? WHERE MaSP = ?',
          [
            productData.MaDSP + namingProduct(productData.TenMau),
            productData.TenMau,
            productData.SoLuong,
            productData.Image,
            this.MaSP,
          ]
        );
    } else {
      // Khong thi tao sp moi
      await db.query(
        'INSERT INTO san_pham (MaSP, MaDSP, TenMau, SoLuong, Image) VALUES (?, ?, ?, ?, ?)',
        [
          productData.MaDSP + namingProduct(productData.TenMau),
          productData.MaDSP,
          productData.TenMau,
          productData.SoLuong,
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
