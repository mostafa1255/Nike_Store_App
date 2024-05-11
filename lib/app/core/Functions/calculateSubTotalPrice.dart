import '../../data/models/cart_Model.dart';

num calculateSubTotalPrice(List<CartModel> products) {
  num subTotalPrice = 0;
  for (var product in products) {
    subTotalPrice +=
        product.quantity * double.parse(product.productsModel.price!);
  }
  return subTotalPrice;
}
