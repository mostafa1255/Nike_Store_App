import 'package:nike_store_app/app/core/constants.dart';
import 'package:nike_store_app/app/core/tools/global_keys.dart';
import 'package:nike_store_app/app/core/tools/remote_notification_sevices.dart';
import 'package:nike_store_app/app/data/manager/auth%20cubits/register_Cubit/register_cubit.dart';
import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/views/common_widgets/customMainButton.dart';
import '../../../common_widgets/Lottie_Loading_Animation.dart';
import 'CustomAuthHaveaccount.dart';
import 'RegisterBlocListener.dart';
import 'RegisterFormField.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubitRead = context.read<RegisterCubit>();
    var regCubit = BlocProvider.of<RegisterCubit>(context);
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: registerBlocListener,
      builder: (context, state) {
        if (state is RegisterLoading) {
          return const Lottie_Loading_Animation();
        }
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
                  onPressed: () {
                    //       GoRouter.of(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_rounded),
                ),
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
                onPressed: () async {
                  if (GlobalKeys.riKey2.currentState!.validate()) {
                    RemoteNotificationService
                        .actionWhenFcmMessageReceivedInBackground(
                            context: context);
                    RemoteNotificationService
                        .actionWhenFcmMessageReceivedInTerminated(
                            context: context);
                    await BlocProvider.of<RegisterCubit>(context)
                        .signUpwithEmailandPassword(
                      phoneNumber: int.parse(cubitRead.phoneController.text),
                      name: cubitRead.nameController.text,
                      email: cubitRead.emailController.text,
                      password: cubitRead.passController.text,
                    );
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
                onPressed: () {
                  regCubit.signUpWithGoogle();
                },
              ),
              const VsizedBox(height: 20),
              CustomAuthHaveaccount(
                onTap: () {
                  GoRouter.of(context).pushReplacement(Approuter.loginescreen);
                },
                accountType: "Already Have Account?",
                createOrLogin: " Log In",
              ),
            ],
          )),
        ));
      },
    );
  }
}
