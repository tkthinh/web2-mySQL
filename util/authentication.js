function createUserSession(req, user, action) {
  req.session.uid = user.IDTaiKhoan.toString();
  req.session.role = user.Quyen;
  req.session.save(action);
}

function deleteUserAuthSession(req) {
  req.session.uid = null;
}

module.exports = {
  createUserSession: createUserSession,
  deleteUserAuthSession: deleteUserAuthSession,
};
