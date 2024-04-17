import '../../data/models/cart_Model.dart';

num calculateSubTotalPrice(List<CartModel> products, num totalPrice) {
  num totalQuantity = 0;
  for (var product in products) {
    totalQuantity += product.quantity;
  }
  return totalPrice * totalQuantity;
}
