import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/core/utils/AppFonts.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/manager/paymob_cubit/paymob_cubit.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import '../../../../core/styles/App_Colors.dart';
import 'CheckOutEmailListTile.dart';
import 'CheckOutPhoneListTile.dart';
import 'DetemineUserLocationWidget.dart';
import 'ViewUserLocationMap.dart';

class CheckOutScreenBody extends StatefulWidget {
  const CheckOutScreenBody({super.key});

  @override
  State<CheckOutScreenBody> createState() => _CheckOutScreenBodyState();
}

class _CheckOutScreenBodyState extends State<CheckOutScreenBody> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 550.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15.r)),
            child: Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 14.w,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact Information",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.kSecondFontColor,
                        fontFamily: AppFonts.relwayFamily),
                  ),
                  const CheckOutEmailListTile(),
                  const CheckOutPhoneListTile(),
                  Text(
                    "Address",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kSecondFontColor,
                        fontFamily: AppFonts.relwayFamily),
                  ),
                  const VsizedBox(height: 10),
                  const DetemineUserLocationWidget(),
                  const VsizedBox(height: 15),
                  const ViewUserLocationMap(),
                  const VsizedBox(height: 15),
                  Text(
                    "Payment Method",
                    style: Txtstyle.style14(context: context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.kSecondFontColor,
                        fontFamily: AppFonts.relwayFamily),
                  ),
                  RadioListTile(
                    title: const Text(
                      'Credit Card',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    activeColor: AppColors.kPrimaryColor,
                    value: "credit_card",
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        BlocProvider.of<PaymobCubit>(context).paymentMethod =
                            GloblaVariable.kOnlinePayment;
                        _selectedPaymentMethod = value;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  RadioListTile(
                    title: const Text(
                      'Cash',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                    activeColor: AppColors.kPrimaryColor,
                    value: "cash",
                    groupValue: _selectedPaymentMethod,
                    onChanged: (value) {
                      setState(() {
                        BlocProvider.of<PaymobCubit>(context).paymentMethod =
                            GloblaVariable.kCashPayment;
                        _selectedPaymentMethod = value;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.trailing,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}
