const db = require('../database/database');

class Order {
  // Đang xử lí => Đã hoàn thành / Đã huỷ
  constructor(product, userData, status = 'Đang xử lí', date, orderId) {
    this.productData = product;
    this.userData = userData;
    this.status = status;
    this.date = new Date(date);
    if (this.date) {
      this.formattedDate = this.date.toLocaleDateString('vi-VN');
    }
    this.id = orderId;
  }

  static async findAllOrders() {
    const [orders, fields] = await db.query(
      `SELECT * FROM don_hang`
    );
    
    const orderDetails = await Promise.all(orders.map(async function(order){
      const product = await Order.findProductofOrder(order.MaDH);
      return {
        MaDH: order.MaDH,
        NgayDat: order.NgayDat,
        NguoiDat: order.NguoiDat,
        ThanhTien: order.TongTien,
        TrangThai: order.TrangThai,
        SanPham: product
      };
    }));
    
    return orderDetails;
  }

  static async findProductofOrder(key) {
    const [results] = await db.query(
      `
    SELECT c.SoLuong, s.TenMau, ds.TenDSP
    FROM don_hang AS d, ct_don_hang AS c, san_pham AS s, dong_san_pham AS ds
    WHERE c.MaDH = d.MaDH AND c.MaSP = s.MaSP AND s.MaDSP = ds.MaDSP
    AND c.MaDH = ?`,
      [key]
    );

    return results;
  }

  static async findAllOrderOfUser(user) {
    const [orders, fields] = await db.query(
      `SELECT * FROM don_hang
    WHERE NguoiDat = ?`,
      [user]
    );

    const orderDetails = await Promise.all(orders.map(async function(order){
      const product = await Order.findProductofOrder(order.MaDH);
      return {
        MaDH: order.MaDH,
        NgayDat: order.NgayDat,
        ThanhTien: order.TongTien,
        TrangThai: order.TrangThai,
        SanPham: product
      };
    }));
    
    return orderDetails;
  }

  async save() {
    if (this.id) {
      await db.query(
      `UPDATE don_hang
      SET TrangThai = ?
      WHERE MaDH = ?`,
      [this.status, this.id]
      )
    } else {
      const donHang = {
        maDH: Date.now(),
        thongTinKhachHang: this.userData,
        SanPham: this.productData,
        NgayDat: new Date(),
        TrangThai: this.status,
      };

      await db.query(
        'INSERT INTO don_hang(MaDH, NguoiDat, NgayDat, TongTien, TrangThai) VALUES (?, ?, ?, ?, ?)',
        [
          donHang.maDH,
          donHang.thongTinKhachHang.HoTen,
          donHang.NgayDat,
          donHang.SanPham.totalPrice,
          donHang.TrangThai,
        ]
      );

      for (const item of donHang.SanPham.items) {
        await db.query(
          'INSERT INTO ct_don_hang(MaDH, MaSP, SoLuong) VALUES (?, ?, ?)',
          [donHang.maDH, item.product.MaSP, item.quantity]
        );
      }
    }
  }
}

module.exports = Order;
