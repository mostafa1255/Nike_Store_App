import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/map_cubit/map_cubit.dart';
import 'package:nike_store_app/app/views/screens/track_orders/track_order.dart';
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
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return TrackOrdersScreen(
                              slat: 31.2098923916176,
                              slng: 29.927169866859916,
                              dlat: 31.22756305471722,
                              dlng: 29.95859295129776,
                            );
                          },
                        ));
                        /*   GoRouter.of(context).push(Approuter.mapscreen, extra: {
                          "lat": state.latitude.toString(),
                          "long": state.longitude.toString()
                        });
                        */
                      },
                      icon: Icon(
                        Icons.location_on_rounded,
                        size: 25.sp,
                        color: Colors.white,
                      ));
                }
                return IconButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return TrackOrdersScreen(
                            slat: 31.2098923916176,
                            slng: 29.927169866859916,
                            dlat: 31.22756305471722,
                            dlng: 29.95859295129776,
                          );
                        },
                      ));
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
