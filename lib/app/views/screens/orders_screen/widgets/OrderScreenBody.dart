import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/views/common_widgets/HsizedBox.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/data/models/order_Model.dart';
import '../../../../core/styles/text_Style.dart';

class OrderScreenBody extends StatelessWidget {
  const OrderScreenBody({super.key, required this.products});
  final List<OrderModel> products;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(products.length, (orderIndex) {
              final product = products[orderIndex];
              return Column(
                children: List.generate(product.cartModel!.length, (index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 20.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: product
                                .cartModel![index].productsModel.imageUrl!,
                            width: 100.w,
                            height: 100.h,
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                          const HsizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  product.cartModel![index].productsModel.name!,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(16),
                                    color: AppColors.kFontColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const VsizedBox(height: 5),
                                Text(
                                  "\$${product.cartModel![index].productsModel.price}",
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    color:
                                        AppColors.kFontColor.withOpacity(0.5),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const VsizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Quantity: ${product.cartModel![index].quantity}",
                                      style: TextStyle(
                                        fontSize: ScreenUtil().setSp(16),
                                        color: AppColors.kFontColor,
                                      ),
                                    ),
                                    Text(
                                      product.orderStatus!,
                                      style: Txtstyle.style12(context: context)
                                          .copyWith(
                                        color:
                                            products[orderIndex].orderStatus ==
                                                    GloblaVariable.kInWay
                                                ? AppColors.kPrimaryColor
                                                : Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            }),
          ),
        ),
      ),
    );
  }
}
