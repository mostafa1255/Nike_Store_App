import '../../views/screens/home_Screen/widgets/SliderPriceFilter.dart';
import '../tools/reg_imp.dart';

Future<dynamic> filterInBottomSheetFunction(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
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
