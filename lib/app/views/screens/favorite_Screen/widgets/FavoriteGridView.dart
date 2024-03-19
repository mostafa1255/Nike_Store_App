import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../common_widgets/FavoriteIconAction.dart';
import '../../../common_widgets/HsizedBox.dart';
import '../../../common_widgets/VsizedBox.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10.h,
              mainAxisSpacing: 14.w,
              childAspectRatio: 3.h / 3.8.h,
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            return SizedBox(
              height: 265.h,
              width: 180.w,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.r),
                ),
                margin: EdgeInsets.zero,
                elevation: 0.0,
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          backgroundColor: Colors.grey.withOpacity(0.08),
                          radius: 19.r,
                          child: FavoriteIconAction(
                            favProduct: ProductsModel(
                                id: "d",
                                brand: "brand ",
                                name: "name",
                                price: "200",
                                imageUrl: "",
                                description: "description"),
                          )),
                      Center(
                        child: SizedBox(
                            width: 140.w,
                            height: 90.h,
                            child: Image.asset(
                              AppImages.imagenikeshoes,
                              fit: BoxFit.cover,
                            )),
                      ),
                      const VsizedBox(height: 5),
                      Text(
                        "BEST SELLER",
                        style: Txtstyle.style12(context: context).copyWith(
                            fontFamily: Constants.popinsFamily,
                            color: AppColors.kPrimaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      const VsizedBox(height: 3),
                      Flexible(
                        child: Text(
                          "Nike",
                          overflow: TextOverflow.ellipsis,
                          style: Txtstyle.style16(context: context).copyWith(
                              fontFamily: Constants.relwayFamily,
                              color: AppColors.kFontColor,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      const VsizedBox(height: 5),
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              "\$375",
                              overflow: TextOverflow.ellipsis,
                              style: Txtstyle.style14(context: context)
                                  .copyWith(
                                      fontFamily: Constants.popinsFamily,
                                      color: AppColors.kFontColor,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          const Spacer(),
                          CircleAvatar(
                            backgroundColor: AppColors.kredColor,
                            radius: 10.r,
                          ),
                          const HsizedBox(width: 10),
                          CircleAvatar(
                            backgroundColor: AppColors.kpurpleColor,
                            radius: 10.r,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
