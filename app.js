const path = require('path');
const express = require('express');
const expressSession = require('express-session');

const sessionConfigurator = require('./util/session');
const db = require('./database/database');

const errorHandlerMiddleware = require('./middlewares/error-handler');
const checkAuthStatusMiddleware = require('./middlewares/auth-check');
const cartMiddleware = require('./middlewares/cart');
const notFoundMiddleware = require('./middlewares/not-found');
const protectRoutesMiddleware = require('./middlewares/protect-routes');

const baseRoutes = require('./routes/base-routes');
const authRoutes = require('./routes/auth-routes');
const productRoutes = require('./routes/product-routes');
const cartRoutes = require('./routes/cart-routes');
const adminRoutes = require('./routes/admin-routes');
const orderRoutes = require('./routes/order-routes');

const app = express();

app.set('view engine', 'ejs');
app.set('views', path.join(__dirname, 'views'));

app.use(express.static('public'));
app.use('/products/assets', express.static('product-data'));

app.use(express.urlencoded({ extended: false }));
app.use(express.json());

const sessionConfig = sessionConfigurator.createSessionConfig();

app.use(expressSession(sessionConfig));

app.use(checkAuthStatusMiddleware);
app.use(cartMiddleware);

app.use(baseRoutes);
app.use(authRoutes);
app.use(productRoutes);
app.use('/cart', cartRoutes);
app.use('/orders', orderRoutes);
app.use('/admin', protectRoutesMiddleware, adminRoutes);
app.use(notFoundMiddleware);

app.use(errorHandlerMiddleware);

db.getConnection()
  .then(function () {
    app.listen(3000);
  })
  .catch(function (error) {
    console.log('Khong the ket noi den co so du lieu');
    console.log(error);
  });
