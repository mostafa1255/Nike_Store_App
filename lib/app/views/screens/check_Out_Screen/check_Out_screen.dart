import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/tools/api_Services.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/core/tools/save_user_info.dart';
import 'package:nike_store_app/app/data/manager/order_cubit/order_cubit.dart';
import 'package:nike_store_app/app/data/manager/paymob_cubit/paymob_cubit.dart';
import 'package:nike_store_app/app/data/models/User_Model.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';
import 'package:nike_store_app/app/data/repos/order_repo/order_repo_impl.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import '../../../core/utils/AppFonts.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../core/styles/text_Style.dart';
import '../../common_widgets/CustomBackIcon.dart';
import '../my_cart_Screen/widgets/BottomNavBarOfMyCheckOutScreen.dart';
import 'widgets/CheckOutAlertDialog.dart';
import 'widgets/CheckOutScreenBody.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({
    super.key,
    required this.subTotalPrice,
    required this.cartModel,
  });
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

