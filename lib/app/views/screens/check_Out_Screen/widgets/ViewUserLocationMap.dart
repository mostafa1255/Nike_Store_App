import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/views/screens/map_Screen/map_screen.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../common_widgets/VsizedBox.dart';

class ViewUserLocationMap extends StatelessWidget {
  const ViewUserLocationMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
            image: const AssetImage(AppImages.imageMap),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "View Map",
            style: Txtstyle.style20(context: context).copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 5),
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.kPrimaryColor,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => MapUserScreen()));
                },
                icon: Icon(
                  Icons.location_on_rounded,
                  size: 25.sp,
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }
}
