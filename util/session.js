const expressSession = require("express-session");
const mySQLStore = require("express-mysql-session")(expressSession);

function createSessionStore() {
  const store = new mySQLStore({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: '11111111',
    database: 'bike-store'
  })
  return store;
}

function createSessionConfig() {
  return {
    secret: "secret-key",
    resave: false,
    saveUninitialized: false,
    store: createSessionStore(),
    cookie: {
      maxAge: 3 * 24 * 60 * 60 * 1000, // 3 ngay
    },
  };
}

module.exports = {
  createSessionConfig: createSessionConfig,
};
