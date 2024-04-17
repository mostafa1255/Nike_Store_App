import 'package:nike_store_app/app/core/constants.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/home_cubits/filter_cubit/filter_cubit.dart';
import '../../../common_widgets/Lottie_Loading_Animation.dart';
import 'CustomHomeCardListView.dart';
import 'TabBarWidget.dart';

class FilterStateBlocBuilder extends StatelessWidget {
  const FilterStateBlocBuilder({
    super.key,
    required this.fCubit,
  });
  final FilterCubit fCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Lottie_Loading_Animation();
        } else if (state is FilterSuccess) {
          return Column(
            children: [
              const VsizedBox(height: 15),
              Row(
                children: [
                  IconButton(
                      onPressed: () => fCubit.deactiveFilterIcon(),
                      icon: const Icon(
                        Icons.close,
                        color: AppColors.kPrimaryColor,
                      )),
                  const HsizedBox(width: 15),
                  Text(
                    "Filtered with Max Price: ${state.maxPrice}\$",
                    style: Txtstyle.style16(context: context)
                        .copyWith(color: AppColors.kDeepGreyColorA6A),
                  ),
                ],
              ),
              const VsizedBox(height: 15),
              state.products.isEmpty
                  ? Center(
                      child: Column(
                        children: [
                          const VsizedBox(height: 150),
                          Text(
                            "There is no product in this Price Range",
                            style: Txtstyle.style16(context: context).copyWith(
                                color: AppColors.kFontColor,
                                fontWeight: FontWeight.bold),
                          ),
                          const VsizedBox(height: 150),
                        ],
                      ),
                    )
                  : CustomHomeCardListView(products: state.products),
            ],
          );
        } else if (state is FilterFailure) {
          return Center(
            child: Text(
              state.errMessage,
              style: Txtstyle.style16(context: context)
                  .copyWith(color: AppColors.kDeepGreyColorA6A),
            ),
          );
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select Category",
              style: Txtstyle.style16(context: context).copyWith(
                  color: AppColors.kFontColor,
                  fontFamily: Constants.relwayFamily),
            ),
            const VsizedBox(height: 15),
            const TabBarWidget(),
          ],
        );
      },
    );
  }
}
