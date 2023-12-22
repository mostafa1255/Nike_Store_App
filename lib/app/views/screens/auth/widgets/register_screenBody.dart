import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/core/styles/App_Image.dart';
import 'package:nike_store_app/app/core/styles/text_Style.dart';
import 'package:nike_store_app/app/data/manager/auth%20cubits/register_Cubit/register_cubit.dart';
import 'package:nike_store_app/app/router/app_router.dart';
import 'package:nike_store_app/app/views/widgets/customMainButton.dart';
import '../../../widgets/HsizedBox.dart';
import '../../../widgets/VsizedBox.dart';
import 'CustomAuthHaveaccount.dart';
import 'RegisterFormField.dart';

class RegisterScreenBody extends StatelessWidget {
  RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    print("mostfa");
    var cubitRead = context.read<RegisterCubit>();
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColors.kOfWhiteColor,
            child: IconButton(
                iconSize: 17.sp,
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_rounded)),
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Register Account",
              style: Txtstyle.style32(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.w,
              child: Text(
                "Fill your details or continue with social media",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: AppColors.kGreyColorB81),
              ),
            ),
          ),
          const RegisterFormField(),
          const VsizedBox(height: 27),
          const VsizedBox(height: 15),
          CustomMainButton(
            width: 375.w,
            fcolorWhite: true,
            txt: "Sign Up",
            color: AppColors.kPrimaryColor,
            onPressed: () {
              if (cubitRead.formKey.currentState!.validate()) {
                BlocProvider.of<RegisterCubit>(context).register(
                  email: cubitRead.emailController.text,
                  password: cubitRead.passController.text,
                );
              } else {
                print("Uncorrect");
              }
            },
          ),
          BlocListener<RegisterCubit, RegisterState>(
            child: const SizedBox.shrink(),
            listener: (context, state) {
              if (state is RegisterSuccess) {
                GoRouter.of(context).push(Approuter.homescreen);
              } else if (state is RegisterFailure) {
                print("Register Faliure with${state.errMessage}");
              }
            },
          ),
          const VsizedBox(height: 25),
          CustomMainButton(
            widget: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(AppImages.iconGoogle),
                const HsizedBox(width: 15),
                Text(
                  "Sign In with Google ",
                  style: Txtstyle.style14(context: context).copyWith(
                      fontFamily: Constants.relwayFamily,
                      color: AppColors.kFontColor),
                )
              ],
            ),
            fcolorWhite: true,
            color: AppColors.kOfWhiteColor,
            onPressed: () {},
          ),
          const VsizedBox(height: 20),
          CustomAuthHaveaccount(
            onTap: () {
              GoRouter.of(context).push(Approuter.loginescreen);
            },
            accountType: "Already Have Account?",
            createOrLogin: " Log In",
          ),
        ],
      )),
    ));
  }
}
