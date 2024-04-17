import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/constants.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/models/Products_Model.dart';
import 'dart:async';
import 'CustomStarsInNewArrivals.dart';

class NewArrivalsAndOffersHomeListView extends StatefulWidget {
  const NewArrivalsAndOffersHomeListView({
    super.key,
    required this.products,
  });
  final List<ProductsModel> products;
  @override
  State<NewArrivalsAndOffersHomeListView> createState() =>
      _NewArrivalsAndOffersHomeListViewState();
}

class _NewArrivalsAndOffersHomeListViewState
    extends State<NewArrivalsAndOffersHomeListView> {
  final PageController _pageController = PageController();
  final Duration _scrollDuration = const Duration(seconds: 2);
  @override
  void initState() {
    super.initState();
    _scrollListView();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scrollListView() {
    Future.delayed(Duration(seconds: widget.products.length), () {
      if (_pageController.hasClients &&
          _pageController.page == widget.products.length - 1) {
        _pageController.animateToPage(
          0,
          duration: _scrollDuration,
          curve: Curves.easeInOut,
        );
      } else if (_pageController.hasClients) {
        _pageController.animateToPage(
          _pageController.page!.toInt() + 1,
          duration: _scrollDuration,
          curve: Curves.easeInOut,
        );
      }
      _scrollListView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 150.h,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150.h,
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.w, vertical: 15.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Summer Sale",
                            style: Txtstyle.style12(context: context).copyWith(
                                color: AppColors.kFontColor,
                                fontFamily: Constants.relwayFamily),
                          ),
                          Text(
                            "15 % OFF",
                            style: Txtstyle.style34(context: context).copyWith(
                              color: AppColors.kpurpleColor,
                              fontFamily: Constants.alfaSlabOne,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  right: 20.w,
                  top: -3,
                  child: Container(
                    width: 120.w,
                    height: 120.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                widget.products[index].imageUrl!))),
                  )),
              Positioned(
                  bottom: 25.h,
                  right: 25.w,
                  child: SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: Image.asset(AppImages.imageshadowshoes),
                  )),
              const CustomStarsInNewArrivals(
                top: 35,
                right: -10,
              ),
              const CustomStarsInNewArrivals(
                top: 30,
                right: 150,
              ),
              const CustomStarsInNewArrivals(
                top: 30,
                right: 140,
              ),
              const CustomStarsInNewArrivals(
                top: 35,
                right: 0,
              ),
            ],
          );
        },
      ),
    );
  }
}
