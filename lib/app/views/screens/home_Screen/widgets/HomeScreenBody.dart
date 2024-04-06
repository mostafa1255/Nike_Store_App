import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/home_cubits/filter_cubit/filter_cubit.dart';
import 'package:nike_store_app/app/views/screens/home_Screen/widgets/CustomHeaderofHomeItemListView.dart';
import 'FilterIconwithActions.dart';
import 'FilterStateBlocBuilder.dart';
import 'NewArrivalsBlocBuilder.dart';
import 'SearchBlocBuilder.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var fCubit = BlocProvider.of<FilterCubit>(context);

    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 16.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              SearchBlocBuilder(),
              FilterIconwithActions(),
            ],
          ),
          const VsizedBox(height: 10),
          FilterStateBlocBuilder(fCubit: fCubit),
          const VsizedBox(height: 15),
          const CustomHeaderofHomeItemListView(
              popularOrNewarrival: "New Arrivals"),
          const VsizedBox(height: 0),
          const NewArrivalsBlocBuilder()
        ],
      )),
    ));
  }
}

