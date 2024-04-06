import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/home_cubits/filter_cubit/filter_cubit.dart';

class FilterIconsBlocBuilder extends StatelessWidget {
  const FilterIconsBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, FilterState>(
      builder: (context, state) {
        if (state is DeactiveFilterIcon ||
            state is FilterLoading ||
            state is FilterFailure ||
            state is FilterInitial) {
          return CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 35.r,
              child: Image.asset(AppImages.iconFilter));
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
