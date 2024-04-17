import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import '../../../../data/models/Products_Model.dart';
import 'AddToCartBlocListenerDetailsScreen.dart';
import 'FavouriteBlocProviderWithAction.dart';
import 'MorerelevantShoesListViewInDetailsScreen.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key, required this.productsModel});
  final ProductsModel productsModel;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        productsModel.name!,
                        style: Txtstyle.style26(context: context)
                            .copyWith(color: AppColors.kFontColor),
                      ),
                    ),
                    const VsizedBox(height: 10),
                    SizedBox(
                      width: 220.w,
                      child: Text(
                        "Men's Shoes",
                        style: Txtstyle.style16(context: context).copyWith(
                            color: AppColors.kGreyColorB81,
                            fontFamily: Constants.relwayFamily),
                      ),
                    ),
                    const VsizedBox(height: 7),
                    Text(
                      "\$ ${productsModel.price}",
                      style: Txtstyle.style20(context: context).copyWith(
                          color: AppColors.kFontColor,
                          fontFamily: Constants.popinsFamily),
                    ),
                    const VsizedBox(height: 35),
                    Align(
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 95.w,
                              bottom: 0.h,
                              child: Container(
                                width: 160.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 30,
                                        color: Colors.grey.withOpacity(0.4),
                                        offset: const Offset(0, 2),
                                        spreadRadius: 0)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                height: 190.h,
                                width: 375.w,
                                child: CachedNetworkImage(
                                  imageUrl: productsModel.imageUrl!,
                                  fit: BoxFit.cover,
                                )),
                          ],
                        )),
                    const VsizedBox(height: 50),
                    Text(
                      "Discover Similar Styles by This Vendor",
                      style: Txtstyle.style14(context: context).copyWith(
                          color: AppColors.kFontColor.withOpacity(0.7),
                          fontFamily: Constants.popinsFamily),
                    ),
                    const VsizedBox(height: 20),
                    MorerelevantShoesListViewInDetailsScreen(
                      vendorId: productsModel.vendorId,
                    ),
                    const VsizedBox(height: 50),
                    Text(
                      productsModel.description!,
                      style: Txtstyle.style14(context: context).copyWith(
                          color: AppColors.kGreyColorB81.withOpacity(0.8),
                          fontFamily: Constants.popinsFamily),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const HsizedBox(width: 0),
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor:
                      AppColors.kDeepGreyColorA6A.withOpacity(0.08),
                  child: FavouriteBlocProviderWithAction(
                      productsModel: productsModel),
                ),
                const HsizedBox(width: 25),
                AddToCartBlocListenerDetailsScreen(
                    productsModel: productsModel),
              ],
            ),
            const VsizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}

Future<void> calcSizeImage() async {
  final fileStat = await File('Hero Image.png').stat();
  print('${fileStat.size} bytes');
  print('${fileStat.size ~/ 1024} KB');
}
/*-void calcSizeImage() async {
-  File imageFile = File('Hero Image.png');
-  if (imageFile.existsSync()) {
-    // The file exists, proceed with reading it.
-    var decodedImage = await decodeImageFromList(imageFile.readAsBytesSync());
-    print(decodedImage.width);
-    print(decodedImage.height);
-    // Rest of your code...
-  } else {
-    print('File does not exist: ${imageFile.path}');
-  }
}
<<<<<<<  f3c34d63-ea93-4c69-8891-e8ab99f6d326  >>>>>>>
* */