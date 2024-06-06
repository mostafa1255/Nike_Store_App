import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../core/utils/global_variable.dart';
import '../../../../data/manager/paymob_cubit/paymob_cubit.dart';

class CustomRadioListTile extends StatefulWidget {
  const CustomRadioListTile({super.key});

  @override
  State<CustomRadioListTile> createState() => _PlaceholderState();
}

class _PlaceholderState extends State<CustomRadioListTile> {
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile(
          title: Text(
            'Cash',
            style: Txtstyle.style15(context: context).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          activeColor: AppColors.kPrimaryColor,
          value: GloblaVariable.kCashPayment,
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
            borderRadius: BorderRadius.circular(50.r),
          ),
        ),
        RadioListTile(
          title: Text(
            'Credit Card',
            style: Txtstyle.style15(context: context).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          activeColor: AppColors.kPrimaryColor,
          value: GloblaVariable.kOnlinePayment,
          groupValue: _selectedPaymentMethod,
          onChanged: (value) {
            setState(() {
              BlocProvider.of<PaymobCubit>(context).paymentMethod =
                  GloblaVariable.kOnlinePayment;
            });
            _selectedPaymentMethod = value;
          },
          controlAffinity: ListTileControlAffinity.trailing,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
      ],
    );
  }
}
