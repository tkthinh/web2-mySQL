const mysql = require('mysql2/promise');

const connection = mysql.createPool({
    host: 'localhost',
    database: 'bike-store',
    user: 'root',
    password: '11111111'
});

module.exports = connection;