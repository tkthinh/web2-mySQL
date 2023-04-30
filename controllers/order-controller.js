const Order = require('../models/order-model');
const User = require('../models/user-model');

async function getOrders(req, res, next) {
  const user = new User(res.locals.username);
  try {
    const userInformation = await user.findUserWithUserName();
    const orders = await Order.findAllOrder(userInformation.HoTen);
    res.render('user/order/orders', { orders: orders });
  } catch (error) {
    next(error);
    return;
  }
}

async function createOrder(req, res, next) {
  const cart = res.locals.cart;

  const user = new User(res.locals.username);
  let userInformation;
  try {
    userInformation = await user.findUserWithUserName();
  } catch (error) {
    return next(error);
  }

  const order = new Order(cart, userInformation);

  try {
    order.save();
  } catch (error) {
    next(error);
    return;
  }

  req.session.cart = null;

  res.redirect('/orders');
}

module.exports = {
  getOrders: getOrders,
  createOrder: createOrder,
};
