function convertToEnglish(str) {
  str = str.replace(/đ/g, 'd').replace(/Đ/g, 'D');
  str = str.replace(/á/g, 'a').replace(/à/g, 'a').replace(/ả/g, 'a').replace(/ã/g, 'a').replace(/ạ/g, 'a');
  str = str.replace(/é/g, 'e').replace(/è/g, 'e').replace(/ẻ/g, 'e').replace(/ẽ/g, 'e').replace(/ẹ/g, 'e');
  str = str.replace(/í/g, 'i').replace(/ì/g, 'i').replace(/ỉ/g, 'i').replace(/ĩ/g, 'i').replace(/ị/g, 'i');
  str = str.replace(/ó/g, 'o').replace(/ò/g, 'o').replace(/ỏ/g, 'o').replace(/õ/g, 'o').replace(/ọ/g, 'o');
  str = str.replace(/ô/g, 'o').replace(/ơ/g, 'o').replace(/ờ/g, 'o').replace(/ở/g, 'o').replace(/ỡ/g, 'o').replace(/ợ/g, 'o');
  str = str.replace(/ú/g, 'u').replace(/ù/g, 'u').replace(/ủ/g, 'u').replace(/ũ/g, 'u').replace(/ụ/g, 'u');
  str = str.replace(/ư/g, 'u').replace(/ừ/g, 'u').replace(/ử/g, 'u').replace(/ữ/g, 'u').replace(/ự/g, 'u');
  str = str.replace(/ý/g, 'y').replace(/ỳ/g, 'y').replace(/ỷ/g, 'y').replace(/ỹ/g, 'y').replace(/ỵ/g, 'y');

  return str;
}

function namingProduct(colorString) {
  const words = colorString.split(' ');
  let name = words[0].substring(0, 2)

  if(words[1]) {
    name += words[1].substring(0, 2);
  }

  return convertToEnglish(name).toUpperCase();
}

module.exports = namingProduct;