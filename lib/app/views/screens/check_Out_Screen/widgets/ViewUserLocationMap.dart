import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/map_cubit/map_cubit.dart';
import '../../../../core/tools/save_user_info.dart';
import '../../../../core/utils/AppFonts.dart';

class ViewUserLocationMap extends StatelessWidget {
  const ViewUserLocationMap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 120.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          image: DecorationImage(
            image: const AssetImage(AppImages.imageMap),
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3), BlendMode.darken),
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "View Map",
            style: Txtstyle.style20(context: context).copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.white,
                fontFamily: AppFonts.relwayFamily),
          ),
          const VsizedBox(height: 5),
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.kPrimaryColor,
            child: BlocBuilder<MapCubit, MapState>(
              builder: (context, state) {
                if (state is MapLoading) {}
                if (state is MapUpdated) {
                  return IconButton(
                      onPressed: () {
                        GoRouter.of(context).push(Approuter.mapscreen, extra: {
                          "lat": state.latitude.toString(),
                          "long": state.longitude.toString()
                        });
                      },
                      icon: Icon(
                        Icons.location_on_rounded,
                        size: 25.sp,
                        color: Colors.white,
                      ));
                }
                return IconButton(
                    onPressed: () async {
                      String? lat = await SaveUserInfo.getUserLatitude();
                      String? long = await SaveUserInfo.getUserLongitude();
                      if (context.mounted) {
                        GoRouter.of(context).push(Approuter.mapscreen,
                            extra: {"lat": lat, "long": long});
                      }
                    },
                    icon: Icon(
                      Icons.location_on_rounded,
                      size: 25.sp,
                      color: Colors.white,
                    ));
              },
            ),
          )
        ],
      ),
    );
  }
}
