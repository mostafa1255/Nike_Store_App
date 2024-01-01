import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import 'package:nike_store_app/app/data/manager/auth%20cubits/login_Cubit/login_cubit.dart';
import 'package:nike_store_app/app/views/screens/auth/widgets/ForgetPasswordBlocListener.dart';
import '../../../../core/tools/App_Regex.dart';
import '../../../widgets/CustomBackIcon.dart';
import '../../../widgets/CustomTextFormField.dart';
import '../../../widgets/customMainButton.dart';

class ForgetPasswordScreenBody extends StatelessWidget {
  ForgetPasswordScreenBody({super.key});
  final emailcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.only(top: 15.h, left: 14.w, right: 14.w),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomBackAndFavIcon(),
          const VsizedBox(height: 8),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Forgot Password",
              style: Txtstyle.style32(context: context).copyWith(
                  color: AppColors.kFontColor, fontWeight: FontWeight.bold),
            ),
          ),
          const VsizedBox(height: 8),
          //Bloc Listener
          const ForgetPasswordBlocListener(),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: 260.w,
              child: Text(
                "Enter your Email account to reset your password",
                textAlign: TextAlign.center,
                style: Txtstyle.style16(context: context)
                    .copyWith(color: AppColors.kGreyColorB81),
              ),
            ),
          ),
          const VsizedBox(height: 27),
          CustomTextFormField(
            stringController: emailcontroller,
            hinttext: "XYZ@gmail.com",
            securPass: true,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 40),
          CustomMainButton(
            fcolorWhite: true,
            txt: "Reset password",
            color: AppColors.kPrimaryColor,
            onPressed: () async {
              if (emailcontroller.text.isNotEmpty &&
                  AppRegex.isEmailValid(emailcontroller.text)) {
                await BlocProvider.of<LoginCubit>(context)
                    .resetPassword(email: emailcontroller.text);
              }
            },
          ),
        ],
      )),
    ));
  }
}
