import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nike_store_app/app/core/tools/api_Services.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import '../../../../core/tools/save_user_info.dart';
import '../../../../data/manager/order_cubit/order_cubit.dart';
import '../../../../data/models/cart_Model.dart';

class PaymobWebView extends StatefulWidget {
  const PaymobWebView(
      {super.key,
      required this.paymentToken,
      required this.cartModel,
      required this.total,
      required this.paymentMethod});
  final String paymentToken;
  final List<CartModel> cartModel;
  final String total;
  final String paymentMethod;

  @override
  State<PaymobWebView> createState() => _PaymobWebViewState();
}

class _PaymobWebViewState extends State<PaymobWebView> {
  InAppWebViewController? webViewController;
  void startPayment() {
    webViewController?.loadUrl(
      urlRequest: URLRequest(
        url: WebUri("${ApiServices.paymobFrameUrl}${widget.paymentToken}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
            crossPlatform: InAppWebViewOptions(javaScriptEnabled: true)),
        onWebViewCreated: (controller) {
          webViewController = controller;
          startPayment();
        },
        onLoadStop: (controller, url) async {
          String? name = await SaveUserInfo.getUserName();
          String? phone = await SaveUserInfo.getUserPhone();
          String? lat = await SaveUserInfo.getUserLatitude();
          String? long = await SaveUserInfo.getUserLongitude();
          if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "true") {
            //Upload Order To Server
            BlocProvider.of<OrderCubit>(context).uploadAllOrdersProducts(
                products: widget.cartModel,
                total: widget.total,
                lat: lat!,
                long: long!,
                userName: name ?? "unknown",
                userPhone: phone ?? "unknown",
                paymentMethod: widget.paymentMethod);
            print("\$" * 30);
            print("success");
          } else if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "false") {
            print("\$" * 30);
            print("error");
          }
        },
      ),
    );
  }
}
