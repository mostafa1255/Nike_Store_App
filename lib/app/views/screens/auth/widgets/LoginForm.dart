import 'package:nike_store_app/app/core/tools/global_keys.dart';
import '../../../../core/constants.dart';
import '../../../../core/tools/App_Regex.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';
import '../../../common_widgets/CustomTextFormField.dart';
import '../../../common_widgets/SecurePasswordTextField.dart';
import '../../../common_widgets/VsizedBox.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    var logCubit = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: GlobalKeys.riKey1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email Address",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          CustomTextFormField(
            stringController: logCubit.emailController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return "Please enter your correct Email";
              }
            },
            hinttext: "xyz@gmail.com",
            securPass: false,
            width: double.infinity,
            height: 80.h,
          ),
          const VsizedBox(height: 12),
          Text(
            "Password",
            style: Txtstyle.style16(context: context).copyWith(
                color: AppColors.kFontColor,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.relwayFamily),
          ),
          const VsizedBox(height: 8),
          SecurePasswordTextField(
              passController: logCubit.passController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter correct Password";
                } else {
                  return null;
                }
              })
        ],
      ),
    );
  }
}
