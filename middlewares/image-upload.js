const multer = require('multer');
const uuid = require('uuid').v4;

const imageUpload = multer({
  storage: multer.diskStorage({
    destination: 'product-data/img',
    filename: function(req, file, cb) {
      cb(null, uuid() + '-' + file.originalname);
    }
  })
});

module.exports = imageUpload
