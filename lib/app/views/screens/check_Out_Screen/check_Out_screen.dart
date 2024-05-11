import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/tools/api_Services.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/paymob_cubit/paymob_cubit.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import '../../../core/utils/AppFonts.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../common_widgets/CustomBackIcon.dart';
import '../my_cart_Screen/widgets/BottomNavBarOfMyCheckOutScreen.dart';
import 'widgets/CheckOutAlertDialog.dart';
import 'widgets/CheckOutScreenBody.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen(
      {super.key, required this.subTotalPrice, required this.cartModel});
  final num subTotalPrice;
  final List<CartModel> cartModel;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymobCubit(apiServices: ApiServices(dio: Dio())),
      child: Scaffold(
        bottomNavigationBar: BottomNavBarOfMyCheckOutScreen(
          cartModel: cartModel,
          subTotalPrice: subTotalPrice,
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return CheckOutAlertDialog(
                  onPressed: () {
                    GoRouter.of(context).push(Approuter.homescreen);
                  },
                );
              },
            );
          },
        ),
        backgroundColor: AppColors.kOfWhiteColor,
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppColors.kOfWhiteColor,
          leading: CustomBackAndFavIcon(onPressed: () {
            GoRouter.of(context).pop();
          }),
          centerTitle: true,
          title: Text(
            "Check Out",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: AppFonts.relwayFamily),
          ),
        ),
        body: const CheckOutScreenBody(),
      ),
    );
  }
}

class PaymobWebView extends StatefulWidget {
  const PaymobWebView({super.key, required this.paymentToken});
  final String paymentToken;
  @override
  State<PaymobWebView> createState() => _PaymobWebViewState();
}

class _PaymobWebViewState extends State<PaymobWebView> {
  InAppWebViewController? webViewController;
  void startPayment() {
    webViewController?.loadUrl(
      urlRequest: URLRequest(
        url: WebUri(
            "https://accept.paymob.com/api/acceptance/iframes/844444?payment_token=${widget.paymentToken}"),
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
        onLoadStop: (controller, url) {
          if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "true") {
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
