const db = require('../database/database');

class Product {
  constructor(MaSP, TenSP, MaLoaiSP, Gia, SoLuong, Thumbnail) {
    this.MaSP = MaSP;
    this.TenSP = TenSP;
    this.MaLoaiSP = MaLoaiSP;
    this.Gia = +Gia;
    this.SoLuong = +SoLuong;
    this.Thumbnail = Thumbnail; // name of img file
    this.updateThumbnailData();
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
    return new Product(
      product.MaSP,
      product.TenSP,
      product.MaLoaiSP,
      product.Gia,
      product.SoLuong,
      product.Thumbnail
    );
  }

  static async findAll() {
    let result = await db.query('SELECT * FROM san_pham');
    const products = result[0];

    return products.map(function (prod) {
      return new Product(
        prod.MaSP,
        prod.TenSP,
        prod.MaLoaiSP,
        prod.Gia,
        prod.SoLuong,
        prod.Thumbnail
      );
    });
  }

  updateThumbnailData() {
    this.thumbnailPath = `product-data/img/${this.Thumbnail}`;
    this.thumbnailUrl = `/products/assets/img/${this.Thumbnail}`;
  }

  async save() {
    const productData = {
      MaSP: this.MaSP,
      TenSP: this.TenSP,
      MaLoaiSP: this.MaLoaiSP,
      Gia: this.Gia,
      SoLuong: this.SoLuong,
      Thumbnail: this.Thumbnail,
    };
    // Neu co ma SP thi cap nhat san pham
    if (this.MaSP) {
      if (!this.Thumbnail) {
        // th khong cap nhat anh sp
        delete productData.Thumbnail;
        await db.query(
          'UPDATE san_pham SET TenSP = ?, MaLoaiSP = ?, Gia = ?, SoLuong = ? WHERE MaSP = ?',
          [
            productData.TenSP,
            productData.MaLoaiSP,
            productData.Gia,
            productData.SoLuong,
            this.MaSP,
          ]
        );
      } else
        await db.query(
          // th co cap nhat anh sp
          'UPDATE san_pham SET TenSP = ?, MaLoaiSP = ?, Gia = ?, SoLuong = ?, Thumbnail =? WHERE MaSP = ?',
          [
            productData.TenSP,
            productData.MaLoaiSP,
            productData.Gia,
            productData.SoLuong,
            productData.Thumbnail,
            this.MaSP,
          ]
        );
    } else {
      // Khong thi tao sp moi
      await db.query(
        'INSERT INTO san_pham (TenSP, MaLoaiSP, Gia, SoLuong, Thumbnail) VALUES (?, ?, ?, ?, ?)',
        [
          productData.TenSP,
          productData.MaLoaiSP,
          productData.Gia,
          productData.SoLuong,
          productData.Thumbnail,
        ]
      );
    }
  }

  async replaceThumbnail(newThumbnail) {
    this.Thumbnail = newThumbnail;
    this.updateThumbnailData();
  }

  delete() {
    return db.query('DELETE FROM san_pham WHERE MaSP = ?', this.MaSP);
  }
}

module.exports = Product;
