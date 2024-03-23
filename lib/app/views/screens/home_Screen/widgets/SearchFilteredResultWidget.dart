import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import '../../../../core/Functions/saveItemToSearchSharedPreference.dart';
import '../../../../core/constants.dart';

class SearchFilteredResultWidget extends StatelessWidget {
  const SearchFilteredResultWidget({
    super.key,
    required this.filterList,
  });

  final List<String>? filterList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filterList!.length,
      itemBuilder: (context, index) {
        return ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          onTap: () {
            saveItemToSearchSharedPreference(item: filterList![index]);
          },
          title: Text(
            filterList![index],
            style: Txtstyle.style14(context: context).copyWith(
              fontFamily: Constants.popinsFamily,
              color: AppColors.kFontColor,
            ),
          ),
        );
      },
    );
  }
}
