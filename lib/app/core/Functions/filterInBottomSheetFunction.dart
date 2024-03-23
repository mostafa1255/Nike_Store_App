import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../views/screens/home_Screen/widgets/SliderPriceFilter.dart';

Future<dynamic> filterInBottomSheetFunction(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return SizedBox(
        height: 200.h,
        child: const SliderPriceFilter(),
      );
    },
  );
}
