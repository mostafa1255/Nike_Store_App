import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/data/manager/user_cubit/user_cubit.dart';
import 'package:nike_store_app/app/data/models/User_Model.dart';
import '../../../../core/styles/App_Colors.dart';
import '../../../../core/styles/App_Image.dart';
import 'package:nike_store_app/app/views/common_widgets/VsizedBox.dart';
import '../../../../core/tools/save_user_info.dart';
import '../../../../router/app_router.dart';
import 'CustomRowDrawer.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 260.w,
      backgroundColor: AppColors.kSecondaryColor,
      child: Padding(
        padding: EdgeInsets.only(left: 25.w, top: 40.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is FetchUserDataFailure) {
                  return Text(state.errMessage,
                      style: Txtstyle.style20(context: context).copyWith(
                        color: Colors.white,
                      ));
                } else if (state is FetchUserDataSuccess) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      state.userModel.imageUrl!.isEmpty ||
                              state.userModel.imageUrl == null
                          ? Center(
                              child: Icon(
                              Icons.person,
                              size: 90.sp,
                              color: Colors.white,
                            ))
                          : CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 45.r,
                              backgroundImage:
                                  NetworkImage(state.userModel.imageUrl!),
                            ),
                      const VsizedBox(height: 15),
                      Center(
                        child: Text(
                          state.userModel.name!,
                          style: Txtstyle.style20(context: context),
                        ),
                      ),
                    ],
                  );
                } else if (state is FetchUserDataLoading) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                }
                return const SizedBox.shrink();
              },
            ),
            const VsizedBox(height: 45),
            CustomElevatedButtonDrawer(
              onTap: () async {
                String? name = await SaveUserInfo.getUserName();
                String? phone = await SaveUserInfo.getUserPhone();
                String? email = await SaveUserInfo.getUserEmail();
                String? imageUrl = await SaveUserInfo.getUserImageUrl();
                if (context.mounted) {
                  GoRouter.of(context).push(Approuter.profilescreen,
                      extra: UserModel(
                          email: email,
                          userid: "123",
                          name: name,
                          imageUrl: imageUrl,
                          phoneNumber: int.parse(phone!)));
                }
              },
              widget: Icon(
                FontAwesomeIcons.user,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Profile",
            ),
            const VsizedBox(height: 25),
            CustomElevatedButtonDrawer(
              onTap: () {
                GoRouter.of(context).push(Approuter.mycartscreen);
              },
              widget: Image.asset(
                AppImages.iconcart,
                color: Colors.white,
              ),
              text: "My Cart",
            ),
            const VsizedBox(height: 25),
            CustomElevatedButtonDrawer(
              onTap: () {
                GoRouter.of(context).push(Approuter.favoritescreen);
              },
              widget: Icon(
                FontAwesomeIcons.heart,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Favorite",
            ),
            const VsizedBox(height: 25),
            CustomElevatedButtonDrawer(
              onTap: () {
                GoRouter.of(context).push(Approuter.orderscreen);
              },
              widget: Image.asset(
                AppImages.iconordervan,
                color: Colors.white,
              ),
              text: "Orders",
            ),
            const VsizedBox(height: 25),
            CustomElevatedButtonDrawer(
              onTap: () {},
              widget: Icon(
                FontAwesomeIcons.bell,
                size: 20.sp,
                color: Colors.white,
              ),
              text: "Notification",
            ),
            const VsizedBox(height: 25),
            Divider(
              color: Colors.white,
              thickness: 1.4.w,
              endIndent: 20.w,
              indent: 0,
            ),
            const VsizedBox(height: 35),
            CustomElevatedButtonDrawer(
              onTap: () {},
              widget: Image.asset(
                AppImages.iconSignOut,
                color: Colors.white,
              ),
              text: "Sign Out",
            ),
          ],
        ),
      ),
    );
  }
}
