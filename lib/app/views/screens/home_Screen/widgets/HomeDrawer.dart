import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';

import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../widgets/VsizedBox.dart';
import 'CustomRowDrawer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kSecondaryColor,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, top: 75.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 45.r,
            ),
            const VsizedBox(height: 15),
            Text(
              "Mostafa Yasser",
              style: Txtstyle.style20(context: context),
            ),
            const VsizedBox(height: 45),
            CustomRowDrawer(
              widget: Icon(
                FontAwesomeIcons.user,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Profile",
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Image.asset(
                AppImages.iconcart,
                color: Colors.white,
              ),
              text: "My Cart",
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Icon(
                FontAwesomeIcons.heart,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Favorite",
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Image.asset(
                AppImages.iconordervan,
                color: Colors.white,
              ),
              text: "My Cart",
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Icon(
                FontAwesomeIcons.bell,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Favorite",
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Image.asset(
                AppImages.iconsettings,
                color: Colors.white,
              ),
              text: "Favorite",
            ),
            const VsizedBox(height: 35),
            Divider(
              color: Colors.white,
              thickness: 1.4.w,
              endIndent: 20.w,
              indent: 0,
            ),
            const VsizedBox(height: 35),
            CustomRowDrawer(
              widget: Image.asset(
                AppImages.iconSignOut,
                color: Colors.white,
              ),
              text: "Sign Out",
            ),
          ],
        ),
      ),
    );
  }
}

