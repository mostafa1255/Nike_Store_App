import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_store_app/app/core/tools/api_Services.dart';
import 'package:nike_store_app/app/core/tools/save_user_info.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/core/utils/paymob_Keys.dart';
import 'package:nike_store_app/app/data/models/paymob_model.dart';
import '../../models/cart_Model.dart';
part 'paymob_state.dart';

class PaymobCubit extends Cubit<PaymobState> {
  PaymobCubit({required this.apiServices}) : super(PaymobInitial());
  ApiServices apiServices;
  String paymentMethod = GloblaVariable.kCashPayment;
  Future<String> payWithPaymob({
    required List<CartModel> products,
    required String totalAmount,
  }) async {
    int total = int.parse(totalAmount) * 100;
    String token = await getToken();
    String orderId = await createOrder(
        token: token, products: products, totalAmount: total.toString());
    String paymentKey = await payOrder(
        token: token, orderId: orderId, totalAmount: total.toString());
    return paymentKey;
  }

  Future<String> getToken() async {
    try {
      final response = await apiServices.dioPost(
          url: ApiServices.initPaymobUrl, data: {"api_key": ApiKeys.apikey});
      return response.data["token"];
    } catch (e) {
      rethrow;
    }
  }

  Future<String> createOrder({
    required String token,
    required List<CartModel> products,
    required String totalAmount,
  }) async {
    List<PaymobModel> paymobModelList = [];
    print("*" * 20);
    for (var element in products) {
      print("*" * 20);
      print(element.quantity);
      print((int.parse(element.productsModel.price!) * 100).toString());
      paymobModelList.add(PaymobModel(
        name: element.productsModel.name!,
        description: element.productsModel.description!,
        amountCents: (int.parse(element.productsModel.price!) * 100).toString(),
        quantity: element.quantity,
      ));
    }
    try {
      final response =
          await apiServices.dioPost(url: ApiServices.orderPaymobUrl, data: {
        "auth_token": token,
        "delivery_needed": "true",
        "amount_cents": totalAmount,
        "currency": "EGP",
        "items": paymobModelList
      });
      return response.data["id"].toString();
    } catch (e) {
      print(e);

      rethrow;
    }
  }

  Future<String> payOrder(
      {required String token,
      required String orderId,
      required String totalAmount}) async {
    final userEmail = await SaveUserInfo.getUserEmail();
    final userName = await SaveUserInfo.getUserName();
    final userPhone = await SaveUserInfo.getUserPhone();
    try {
      final response = await apiServices
          .dioPost(url: ApiServices.getPaymobPaymentTokenUrl, data: {
        "auth_token": token,
        "amount_cents": totalAmount,
        "expiration": 3600,
        "order_id": orderId,
        "billing_data": {
          "apartment": "NA",
          "email": userEmail,
          "floor": "NA",
          "first_name": userName,
          "street": "NA",
          "building": "NA",
          "phone_number": userPhone,
          "shipping_method": "NA",
          "postal_code": "NA",
          "city": "NA",
          "country": "Egypt",
          "last_name": userName,
          "state": "NA"
        },
        "currency": "EGP",
        "integration_id": ApiKeys.integrationId,
        "lock_order_when_paid": "false"
      });
      return response.data["token"];
    } catch (e) {
      rethrow;
    }
  }
}
