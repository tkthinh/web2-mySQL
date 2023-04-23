function checkAuthStatus(req, res, next) {
  const uid = req.session.uid;

  if (!uid) {
    return next();
  }

  res.locals.uid = uid;
  res.locals.isAuth = true;
  res.locals.username = req.session.username;
  res.locals.role = req.session.role;
  next();
}

module.exports = checkAuthStatus;
