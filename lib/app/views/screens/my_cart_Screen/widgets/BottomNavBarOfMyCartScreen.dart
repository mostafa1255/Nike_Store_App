import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/views/widgets/VsizedBox.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/customMainButton.dart';

class BottomNavBarOfMyCartScreen extends StatelessWidget {
  const BottomNavBarOfMyCartScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                    fontFamily: Constants.relwayFamily,
                    color: AppColors.kDeepGreyColor),
              ),
              trailing: Text(
                "\$753.95",
                style: Txtstyle.style16(context: context).copyWith(
                    fontFamily: Constants.popinsFamily,
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
                    fontFamily: Constants.relwayFamily,
                    color: AppColors.kDeepGreyColor),
              ),
              trailing: Text(
                "\$60.20",
                style: Txtstyle.style16(context: context).copyWith(
                    fontFamily: Constants.popinsFamily,
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
                  fontFamily: Constants.relwayFamily,
                  color: AppColors.kFontColor),
            ),
            trailing: Text(
              "\$814.15",
              style: Txtstyle.style16(context: context).copyWith(
                  fontFamily: Constants.popinsFamily,
                  color: AppColors.kPrimaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          CustomMainButton(
            width: 350.w,
            color: AppColors.kPrimaryColor,
            fcolorWhite: true,
            onPressed: () {},
            txt: "Checkout",
          )
        ],
      ),
    );
  }
}
