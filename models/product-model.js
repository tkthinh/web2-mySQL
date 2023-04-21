const db = require('../database/database');

class Product {
  constructor(MaDSP, TenDSP, MaLoaiSP, Gia, DongCo, Thumbnail, Hero, ThongSoSP = {}) {
    this.MaDSP = MaDSP;
    this.TenDSP = TenDSP;
    this.MaLoaiSP = MaLoaiSP;
    this.Gia = +Gia;
    this.DongCo = +DongCo;
    this.Thumbnail = Thumbnail; // name of img file
    this.Hero = Hero;
    this.updateImageData();
  }

  static async findById(id) {
    const [results] = await db.query(
      'SELECT * FROM dong_san_pham WHERE MaDSP = ? LIMIT 1',
      [id]
    );

    if (!results[0]) {
      const error = new Error('Không tìm thấy sản phẩm!');
      error.code = 404;
      throw error;
    }

    const product = results[0];
    return new Product(
      product.MaDSP,
      product.TenDSP,
      product.MaLoaiSP,
      product.Gia,
      product.DongCo,
      product.Thumbnail,
      product.Hero
    );
  }

  static async findAll() {
    let result = await db.query('SELECT * FROM dong_san_pham');
    const products = result[0];

    return products.map(function (prod) {
      return new Product(
        prod.MaDSP,
        prod.TenDSP,
        prod.MaLoaiSP,
        prod.Gia,
        prod.DongCo,
        prod.Thumbnail,
        prod.Hero
      );
    });
  }

  updateImageData() {
    this.thumbnailPath = `product-data/img/${this.Thumbnail}`;
    this.thumbnailUrl = `/products/assets/img/${this.Thumbnail}`;
    this.heroPath = `product-data/img/${this.Hero}`;
    this.heroUrl = `/products/assets/img/${this.Hero}`;
  }

  async save() {
    const productData = {
      MaDSP: this.MaDSP,
      TenDSP: this.TenDSP,
      MaLoaiSP: this.MaLoaiSP,
      Gia: this.Gia,
      DongCo: this.DongCo,
      Thumbnail: this.Thumbnail,
      Hero: this.Hero,
    };
    // Neu co ma DSP thi cap nhat san pham
    if (this.MaDSP) {
      if (!this.Thumbnail && !this.Hero) {
        // th khong cap nhat anh
        await db.query(
          'UPDATE dong_san_pham SET TenDSP = ?, MaLoaiSP = ?, Gia = ?, DongCo = ? WHERE MaDSP = ?',
          [
            productData.TenDSP,
            productData.MaLoaiSP,
            productData.Gia,
            productData.DongCo,
            this.MaDSP,
          ]
        );
      } else
        await db.query(
          // th co cap nhat anh
          'UPDATE dong_san_pham SET TenDSP = ?, MaLoaiSP = ?, Gia = ?, DongCo = ?, Thumbnail = ?, HeroIMG = ?, WHERE MaDSP = ?',
          [
            productData.TenDSP,
            productData.MaLoaiSP,
            productData.Gia,
            productData.DongCo,
            productData.Thumbnail,
            productData.Hero,
            this.MaDSP,
          ]
        );
    } else {
      // Khong thi tao sp moi
      await db.query(
        'INSERT INTO dong_san_pham (TenDSP, MaLoaiSP, Gia, DongCo, Thumbnail, HeroIMG) VALUES (?, ?, ?, ?, ?, ?)',
        [
          productData.TenDSP,
          productData.MaLoaiSP,
          productData.Gia,
          productData.DongCo,
          productData.Thumbnail,
          productData.Hero,
        ]
      );
    }
  }

  delete() {
    return db.query('DELETE FROM dong_san_pham WHERE MaDSP = ?', this.MaDSP);
  }
}

module.exports = Product;
