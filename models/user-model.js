const db = require('../database/database');

const bcrypt = require('bcryptjs');

class User {
  constructor(TenDN, MatKhau, email, HoTen) {
    this.TenDN = TenDN;
    this.MatKhau = MatKhau;
    this.email = email;
    this.HoTen = HoTen;
  }

  static async findAll(limit, offset){
    const [users, field] = await db.query('SELECT * FROM tai_khoan LIMIT ? OFFSET ?', [limit, offset]);

    return users;
  }

  static async countUser() {
    const [count, _] = await db.execute(`
    SELECT COUNT(*) AS count FROM tai_khoan
    `);
    const userCount = count[0].count;
    return userCount;
  }

  static async setRole(userid, role) {
    await db.query('UPDATE tai_khoan SET MaPhanQuyen = ? WHERE IDTaiKhoan = ?', [role, userid]);
  }

  async findUserWithUserName() {
    const [results, fields] = await db.query(
      'SELECT * FROM tai_khoan WHERE TenDangNhap = ?',
      this.TenDN
    );
    return results[0];
  }

  async findUserWithEmail() {
    const [results, fields] = await db.query(
      'SELECT * FROM tai_khoan WHERE Email = ?',
      this.email
    );
    return results[0];
  }

  async isExisted() {
    const existingUser = (await this.findUserWithUserName() ||
     await this.findUserWithEmail());
    console.log(existingUser);
    if (existingUser) {
      return true;
    }
    return false;
  }

  async signup() {
    const hashedPassword = await bcrypt.hash(this.MatKhau, 12);
    let inputData = [this.TenDN, hashedPassword, this.email, this.HoTen];

    await db.query(
      'INSERT INTO tai_khoan (TenDangNhap, MatKhau, Email, HoTen, NgayTao, MaPhanQuyen) VALUES (?, CURDATE(), 0)',
      [inputData]
    );
  }

  comparePassword(hashedPassword) {
    return bcrypt.compare(this.MatKhau, hashedPassword);
  }
}

module.exports = User;
