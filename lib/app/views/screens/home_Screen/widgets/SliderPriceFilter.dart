import 'package:nike_store_app/app/core/tools/reg_imp.dart';

class SliderPriceFilter extends StatefulWidget {
  const SliderPriceFilter({super.key});

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderPriceFilter> {
  double _sliderValue = 50.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Slider(
          value: _sliderValue,
          min: 50,
          max: 5000,
          label: _sliderValue.toString(),
          divisions: 20,
          activeColor: AppColors.kPrimaryColor,
          inactiveColor: AppColors.kPrimaryColor.withOpacity(0.3),
          onChanged: (value) {
            setState(() {
              print(value);
              _sliderValue = value;
            });
          },
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text('OK'),
        ),
      ],
    );
  }
}
