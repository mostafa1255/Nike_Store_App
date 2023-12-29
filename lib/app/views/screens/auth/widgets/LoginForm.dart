import '../../../../core/constants.dart';
import '../../../../core/tools/App_Regex.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';
import '../../../widgets/CustomTextFormField.dart';

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
      key: logCubit.formKey,
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
          CustomTextFormField(
            widget: IconButton(
                onPressed: () {}, icon: Image.asset(AppImages.iconeyePassword)),
            hinttext: "Password",
            securPass: true,
            width: double.infinity,
            height: 80.h,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter correct Password";
              } else if (!AppRegex.hasUpperCase(value) ||
                  !AppRegex.hasLowerCase(value) ||
                  !AppRegex.hasMinLength(value)) {
                return " Please Enter Your Correct Password";
              }
            },
          ),
        ],
      ),
    );
  }
}
