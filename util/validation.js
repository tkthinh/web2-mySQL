function isEmpty(value) {
  return !value || value.trim() === '';
}
function userCredentialsAreValid(email, password) {
  return (
    email && email.includes('@') && password && password.trim().length >= 6
  );
}

function validateUser(username, email, password, name) {
  return userCredentialsAreValid(email, password) && !isEmpty(username, name);
}

function passwordIsConfirmed(password, confirmPassword) {
  return password === confirmPassword;
}

module.exports = {
  validateUser: validateUser,
  passwordIsConfirmed: passwordIsConfirmed,
};
