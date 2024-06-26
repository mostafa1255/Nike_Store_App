import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/Functions/setUp_Service_Locator.dart';
import 'package:nike_store_app/app/data/manager/favorite_cubit/favorite_cubit.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo_impl.dart';
import 'package:nike_store_app/app/views/common_widgets/FavoriteIconAction.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/widgets/AddToCartButton.dart';
import '../../../../core/utils/AppFonts.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../router/app_router.dart';
import '../../../common_widgets/VsizedBox.dart';

class CustomHomeCardListView extends StatelessWidget {
  const CustomHomeCardListView({
    super.key,
    required this.products,
  });
  final List<ProductsModel> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 265.h,
      child: ListView.builder(
          itemCount: products.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: 25.w),
              child: SizedBox(
                height: 265.h,
                width: 180.w,
                child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .push(Approuter.detailsscreen, extra: products[index]);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(23.r),
                    ),
                    margin: EdgeInsets.zero,
                    elevation: 0.0,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BlocProvider(
                            create: (context) => FavoriteCubit(
                                homeRepo: getIt.get<HomeRepoImpl>()),
                            child: FavoriteIconAction(
                              favProduct: products[index],
                            ),
                          ),
                          SizedBox(
                              width: 160.w,
                              height: 110.h,
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) {
                                  return const Icon(Icons.error);
                                },
                                imageUrl: products[index].imageUrl!,
                                fit: BoxFit.cover,
                              )),
                          Text(
                            "BEST SELLER",
                            style: Txtstyle.style12(context: context).copyWith(
                                fontFamily: AppFonts.popinsFamily,
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600),
                          ),
                          const VsizedBox(height: 5),
                          Flexible(
                            child: Text(
                              products[index].name!,
                              overflow: TextOverflow.ellipsis,
                              style: Txtstyle.style16(context: context)
                                  .copyWith(
                                      fontFamily: AppFonts.relwayFamily,
                                      color: AppColors.kDeepGreyColorA6A,
                                      fontWeight: FontWeight.w600),
                            ),
                          ),
                          const VsizedBox(height: 18),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "\$${products[index].price}",
                                  overflow: TextOverflow.ellipsis,
                                  style: Txtstyle.style14(context: context)
                                      .copyWith(
                                          fontFamily: AppFonts.popinsFamily,
                                          color: AppColors.kFontColor,
                                          fontWeight: FontWeight.w600),
                                ),
                              ),
                              AddToCartButton(
                                productsModel: products[index],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
