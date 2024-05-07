import 'package:cached_network_image/cached_network_image.dart';
import 'package:nike_store_app/app/core/Functions/setUp_Service_Locator.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/details_cubit/details_cubit.dart';
import '../../../../data/repos/home_rep/home_repo_impl.dart';

class MorerelevantShoesListViewInDetailsScreen extends StatelessWidget {
  const MorerelevantShoesListViewInDetailsScreen({
    super.key,
    required this.vendorId,
  });
  final String vendorId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsCubit(homeRepo: getIt.get<HomeRepoImpl>())
        ..getRelevantProduct(vendorId: vendorId),
      child: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is RelevantProductsSuccsess) {
            return SizedBox(
              width: 375.w,
              height: 87.h,
              child: ListView.builder(
                  itemCount: state.productsList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 20.w, bottom: 10.h),
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).push(Approuter.detailsscreen,
                              extra: state.productsList[index]);
                        },
                        child: Container(
                          width: 70.w,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 8,
                                    color: Colors.grey.withOpacity(0.15),
                                    offset: const Offset(0, 2),
                                    spreadRadius: 0)
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(22.r)),
                          child: Center(
                            child: SizedBox(
                              width: 60.w,
                              height: 60.h,
                              child: CachedNetworkImage(
                                  imageUrl:
                                      state.productsList[index].imageUrl!),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else if (state is RelevantProductsFailure) {
            return Center(
              child: Text(
                state.errMessage,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
