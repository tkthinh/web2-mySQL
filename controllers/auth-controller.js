const User = require('../models/user-model');
const authUtil = require('../util/authentication');
const validation = require('../util/validation');
const sessionFlash = require('../util/session-flash');

function getSignup(req, res) {
  let sessionData = sessionFlash.getSessionData(req);

  if (!sessionData) {
    sessionData = {
      username: '',
      email: '',
      password: '',
      confirmPassword: '',
      name: '',
    };
  }
  res.render('user/auth/signup', { inputData: sessionData });
}

async function signup(req, res, next) {
  const enteredData = {
    username: req.body.username,
    email: req.body.email,
    password: req.body.password,
    name: req.body.name,
  };
  if (
    !validation.validateUser(
      req.body.username,
      req.body.email,
      req.body.password,
      req.body.name
    ) ||
    !validation.passwordIsConfirmed(
      req.body.password,
      req.body['password-confirm']
    )
  ) {
    sessionFlash.flashDataToSession(
      req,
      {
        errorMessage: 'Kiểm tra dữ liệu nhập vào và thử lại !',
        ...enteredData,
      },
      function () {
        res.redirect('/signup');
      }
    );
    return;
  }

  const user = new User(req.body.username, req.body.password, req.body.email, req.body.name);

  try {
    const existingUser = await user.isExisted();
    if (existingUser) {
      sessionFlash.flashDataToSession(
        req,
        {
          errorMessage: 'Tên đăng nhập hoặc Email đã được sử dụng !',
          ...enteredData,
        },
        function () {
          res.redirect('/signup');
        }
      );
      return;
    }
    await user.signup();
  } catch (error) {
    next(error);
    return;
  }

  res.redirect('/login');
}

function getLogin(req, res, next) {
  let sessionData = sessionFlash.getSessionData(req);

  if (!sessionData) {
    sessionData = {
      username: '',
      password: '',
    };
  }

  res.render('user/auth/login', { inputData: sessionData });
}

async function login(req, res, next) {
  const user = new User(req.body.username, req.body.password);
  let existingUser;
  try {
    existingUser = await user.findUserWithUserName();
  } catch (error) {
    next(error);
    return;
  }

  if (!existingUser) {
    sessionFlash.flashDataToSession(
      req,
      {
        errorMessage: 'Tài khoản không tồn tại !',
        username: user.username,
        password: user.password,
      },
      function () {
        res.redirect('/login');
      }
    );
    return;
  }

  const passwordIsCorrect = await user.comparePassword(existingUser.MatKhau);
  if (!passwordIsCorrect) {
    sessionFlash.flashDataToSession(
      req,
      {
        errorMessage: 'Vui lòng kiểm tra lại tài khoản và mật khẩu !',
        username: user.username,
        password: user.password,
      },
      function () {
        res.redirect('/login');
      }
    );
    return;
  }

  authUtil.createUserSession(req, existingUser, function () {
    res.redirect('/');
  });
}

function logout(req, res) {
  authUtil.deleteUserAuthSession(req);
  res.redirect('/');
}

module.exports = {
  getSignup: getSignup,
  signup: signup,
  getLogin: getLogin,
  login: login,
  logout: logout,
};
