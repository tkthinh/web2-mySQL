function convertToEnglish(str) {
  str = str.replace(/đ/g, 'd').replace(/Đ/g, 'D');
  str = str.normalize("NFD").replace(/[\u0300-\u036f]/g, "");
  return str;
}

function namingProduct(colorString) {
  const words = colorString.split(' ');
  let name = ''

  for(let i = 0; i< words.length; i++){
    name += convertToEnglish(words[i])
  }

  return name.toUpperCase();
}

module.exports = namingProduct;