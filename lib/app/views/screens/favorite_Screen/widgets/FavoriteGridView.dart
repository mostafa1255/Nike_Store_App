import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/data/manager/favorite_cubit/favorite_cubit.dart';
import '../../../../core/constants.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/text_Style.dart';
import '../../../../data/repos/home_rep/home_repo_impl.dart';
import '../../../../router/app_router.dart';
import '../../../common_widgets/VsizedBox.dart';

class FavoriteGridView extends StatelessWidget {
  const FavoriteGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            FavoriteCubit(homeRepo: HomeRepoImpl())..getFavoriteProducts(),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoadedSuccess) {
              return SizedBox(
                width: double.infinity,
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.favProductsList.length,
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
                                    backgroundColor:
                                        Colors.grey.withOpacity(0.08),
                                    radius: 19.r,
                                    child: DeleteFromFavourites(
                                      productId:
                                          state.favProductsList[index].id!,
                                    )),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      GoRouter.of(context).push(
                                          Approuter.detailsscreen,
                                          extra: state.favProductsList[index]);
                                    },
                                    child: SizedBox(
                                        width: 140.w,
                                        height: 90.h,
                                        child: CachedNetworkImage(
                                            imageUrl: state
                                                .favProductsList[index]
                                                .imageUrl!)),
                                  ),
                                ),
                                const VsizedBox(height: 5),
                                const VsizedBox(height: 3),
                                Flexible(
                                  child: Text(
                                    state.favProductsList[index].name!,
                                    overflow: TextOverflow.ellipsis,
                                    style: Txtstyle.style18(context: context)
                                        .copyWith(
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
                                        "\$${state.favProductsList[index].price}",
                                        overflow: TextOverflow.ellipsis,
                                        style: Txtstyle.style14(
                                                context: context)
                                            .copyWith(
                                                fontFamily:
                                                    Constants.popinsFamily,
                                                color: AppColors.kFontColor,
                                                fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              );
            } else if (state is FavoriteLoadedFailure) {
              return Center(
                heightFactor: 25.h,
                child: Text(
                  state.errMessage,
                  style: Txtstyle.style18(
                    context: context,
                  ).copyWith(color: AppColors.kGreyColorB81),
                ),
              );
            } else if (state is AddtoFavoriteFailure) {
              return Center(
                child: Text(
                  state.errMessage,
                  style: Txtstyle.style16(
                    context: context,
                  ).copyWith(color: AppColors.kFontColor),
                ),
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ));
  }
}

class DeleteFromFavourites extends StatelessWidget {
  const DeleteFromFavourites({
    super.key,
    required this.productId,
  });
  final String productId;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        BlocProvider.of<FavoriteCubit>(context)
            .deleteFavoriteItem(productId: productId);
      },
      icon: const Icon(
        Icons.favorite_rounded,
        color: Colors.red,
        size: 20,
      ),
    );
  }
}
