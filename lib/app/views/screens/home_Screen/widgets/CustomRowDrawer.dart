import 'package:flutter/material.dart';

import '../../../../core/constants.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../widgets/HsizedBox.dart';

class CustomRowDrawer extends StatelessWidget {
  const CustomRowDrawer({
    super.key,
    required this.widget,
    required this.text,
  });
  final Widget widget;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget,
        const HsizedBox(width: 20),
        Text(
          text,
          style: Txtstyle.style16(context: context)
              .copyWith(fontFamily: Constants.relwayFamily),
        ),
      ],
    );
  }
}