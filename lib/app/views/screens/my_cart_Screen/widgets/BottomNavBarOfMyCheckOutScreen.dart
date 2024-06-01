import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/manager/order_cubit/order_cubit.dart';
import 'package:nike_store_app/app/data/manager/paymob_cubit/paymob_cubit.dart';
import 'package:nike_store_app/app/data/models/cart_Model.dart';
import 'package:nike_store_app/app/data/repos/order_repo/order_repo_impl.dart';
import 'package:nike_store_app/app/views/screens/check_Out_Screen/widgets/PaymobWebView.dart';
import '../../../../core/utils/AppFonts.dart';
import 'package:nike_store_app/app/views/common_widgets/customMainButton.dart';

class BottomNavBarOfMyCheckOutScreen extends StatelessWidget {
  const BottomNavBarOfMyCheckOutScreen({
    super.key,
    this.onPressed,
    required this.subTotalPrice,
    required this.cartModel,
  });
  final void Function()? onPressed;
  final List<CartModel> cartModel;

  final num subTotalPrice;
  @override
  Widget build(BuildContext context) {
    var paymentCubit = BlocProvider.of<PaymobCubit>(context);
    return Container(
      height: 280.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
      child: Column(
        children: [
          SizedBox(
            height: 50.h,
            child: ListTile(
              leading: Text(
                "Subtotal",
                style: Txtstyle.style16(context: context).copyWith(
                    fontFamily: AppFonts.relwayFamily,
                    color: AppColors.kDeepGreyColorA6A),
              ),
              trailing: Text(
                "\$$subTotalPrice",
                style: Txtstyle.style16(context: context).copyWith(
                    fontFamily: AppFonts.popinsFamily,
                    color: AppColors.kSecondFontColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            child: ListTile(
              leading: Text(
                "Delivery",
                style: Txtstyle.style16(context: context).copyWith(
                    fontFamily: AppFonts.relwayFamily,
                    color: AppColors.kDeepGreyColorA6A),
              ),
              trailing: Text(
                "\$60.20",
                style: Txtstyle.style16(context: context).copyWith(
                    fontFamily: AppFonts.popinsFamily,
                    color: AppColors.kSecondFontColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const VsizedBox(height: 15),
          Divider(
              indent: 20.w,
              endIndent: 20.w,
              thickness: 2.5.h,
              color: Colors.grey.withOpacity(0.5)),
          ListTile(
            leading: Text(
              "Total Cost",
              style: Txtstyle.style16(context: context).copyWith(
                  fontFamily: AppFonts.relwayFamily,
                  color: AppColors.kFontColor),
            ),
            trailing: Text(
              "\$${subTotalPrice + 60.20}",
              style: Txtstyle.style16(context: context).copyWith(
                  fontFamily: AppFonts.popinsFamily,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          CustomMainButton(
            width: 350.w,
            color: AppColors.kPrimaryColor,
            fcolorWhite: true,
            onPressed: () async {
              double totalAmount = subTotalPrice + 60.20;
              int totals = totalAmount.toInt();
              String paymentId = await paymentCubit.payWithPaymob(
                  products: cartModel, totalAmount: "$totals");
              if (paymentId != null) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return BlocProvider(
                    create: (context) => OrderCubit(orderRepo: OrderRepoImpl()),
                    child: PaymobWebView(
                      paymentMethod: GloblaVariable.kOnlinePayment,
                      total: paymentCubit.paymentMethod ==
                              GloblaVariable.kCashPayment
                          ? "${subTotalPrice + 60.20}"
                          : "60.20",
                      paymentToken: paymentId,
                      cartModel: cartModel,
                    ),
                  );
                }));
              }
            },
            txt: "Checkout",
          )
        ],
      ),
    );
  }
}

