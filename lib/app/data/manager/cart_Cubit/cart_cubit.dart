import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/repos/cart_repo/cart_repo.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo.dart';
import '../../models/cart_Model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit({required this.cartRepo, required this.homeRepo})
      : super(CartInitial());
  HomeRepo homeRepo;
  CartRepo cartRepo;
  Future<void> updateQuantityofProduct(
      {required String id, required int quantity}) async {
    if (quantity > 0) {
      final result =
          await cartRepo.updateQuantityofProduct(id: id, quantity: quantity);
      result.fold(
        (l) => emit(CartQuantityUpdatedFaliure(errMessage: l.errmessage)),
        (r) => getCartProducts(),
      );
    }
  }

  Future<void> addToCartProducts({required ProductsModel productsModel}) async {
    emit(AddtoCartProductsLoading());
    final result = await cartRepo.addProductWithQuantityToCart(
        productsModel: productsModel);
    result.fold(
      (l) {
        print("Cart Products to failure");
        print(l.errmessage);
        emit(AddtoCartProductsFailure(errMessage: l.errmessage));
      },
      (r) {
        print("Cart Products to succsess");

        emit(AddtoCartProductsSuccsess());
      },
    );
  }

  Future<void> getCartProducts() async {
    final result = await cartRepo.getAllProductswithQuantity();
    result.fold(
      (l) {
        emit(GetFromCartFailure(errMessage: l.errmessage));
      },
      (r) {
        emit(GetFromCartSuccsesswithProducts(
            products: r, totalPriceForProduct: getTotalPrice(r)));
      },
    );
  }

  List<num> getTotalPrice(List<CartModel> products) {
    List<num> subTotalPrice = [];

    for (var product in products) {
      subTotalPrice
          .add(num.parse(product.productsModel.price!) * product.quantity);
    }

    return subTotalPrice;
  }

  Future<void> deleteCartItem({required String productId}) async {
    final result = await homeRepo.deleteProductFromCollection(
      collectionName: "cart",
      productId: productId,
      subCollectionName: "quantity",
    );
    result.fold(
      (l) {
        emit(DeleteCartItemFailure(errMessage: l.errmessage));
      },
      (r) {},
    );
  }
}
