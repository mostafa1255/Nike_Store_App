import 'package:flutter/material.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/home_cubits/filter_cubit/filter_cubit.dart';

class SliderPriceFilter extends StatefulWidget {
  const SliderPriceFilter({super.key});

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderPriceFilter> {
  double sliderValue = 50.0;

  @override
  Widget build(BuildContext context) {
    var fCubit = BlocProvider.of<FilterCubit>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          widthFactor: 3.6.w,
          alignment: Alignment.topLeft,
          child: Text("Filter Price",
              style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
              )),
        ),
        Slider(
          value: sliderValue,
          min: 50,
          max: 5000,
          label: sliderValue.toString(),
          divisions: 20,
          activeColor: AppColors.kPrimaryColor,
          inactiveColor: AppColors.kPrimaryColor.withOpacity(0.3),
          onChanged: (value) {
            setState(() {
              sliderValue = value;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {
            fCubit.getFilterProducts(price: sliderValue.toString());
            setState(() {});
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
