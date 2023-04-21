class Cart {
  constructor(items = [], totalQuantity = 0, totalPrice = 0) {
    this.items = items;
    this.totalQuantity = totalQuantity;
    this.totalPrice = totalPrice;
  }

  addItem(product) {
    const cartItem = {
      product: product,
      quantity: 1,
      totalPrice: product.Gia,
    };

    for (let i = 0; i < this.items.length; i++) {
      const item = this.items[i];
      if (item.product.MaSP === product.MaSP) {
        cartItem.quantity = cartItem.quantity + 1;
        cartItem.totalPrice = product.Gia * cartItem.quantity;
        this.items[i] = cartItem;
        this.totalQuantity++;
        this.totalPrice += product.Gia;
        return;
      }
    }

    this.items.push(cartItem);
    this.totalQuantity++;
    this.totalPrice += product.Gia;
  }
}


module.exports = Cart