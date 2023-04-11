const db = require('../database/database');

const bcrypt = require('bcryptjs');

class User {
  constructor(TenDN, MatKhau, email, HoTen) {
    this.TenDN = TenDN;
    this.MatKhau = MatKhau;
    this.email = email;
    this.HoTen = HoTen;
  }

  async findUserWithUserName() {
    const [result] = await db.query(
      'SELECT * FROM tai_khoan WHERE TenDangNhap = ?',
      this.TenDN
    );
    return result[0];
  }

  async findUserWithEmail() {
    const [result] = await db.query(
      'SELECT * FROM tai_khoan WHERE Email = ?',
      this.email
    );
    return result[0];
  }

  async isExisted() {
    const existingUser = await (this.findUserWithUserName() ||
      this.findUserWithEmail());
    if (existingUser) {
      return true;
    }
    return false;
  }

  async signup() {
    const hashedPassword = await bcrypt.hash(this.MatKhau, 12);
    let inputData = [this.TenDN, hashedPassword, this.email, this.HoTen];

    await db.query(
      'INSERT INTO tai_khoan (TenDangNhap, MatKhau, Email, HoTen, NgayTao, Quyen) VALUES (?, CURDATE(), 0)',
      [inputData]
    );
  }

  comparePassword(hashedPassword) {
    return bcrypt.compare(this.MatKhau, hashedPassword);
  }
}

module.exports = User;
