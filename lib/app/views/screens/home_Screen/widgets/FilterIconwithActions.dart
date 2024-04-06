import 'package:flutter/material.dart';
import '../../../../core/Functions/filterInBottomSheetFunction.dart';
import 'FilterIconsBlocBuilder.dart';

class FilterIconwithActions extends StatelessWidget {
  const FilterIconwithActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => filterInBottomSheetFunction(context),
      child: const FilterIconsBlocBuilder(),
    );
  }
}
