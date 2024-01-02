import 'package:nike_store_app/app/core/tools/reg_imp.dart';
import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';
import 'CustomAlertDialog.dart';

class ForgetPasswordBlocListener extends StatelessWidget {
  const ForgetPasswordBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is ResetPasswordFailure) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ResetPasswordsucsess) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const CustomForgetPasswordAlertDialog();
            },
          );
        } else if (state is ResetPasswordFailure) {
          customsnackBar(context, state.errMessage, Colors.red);
        }
      },
    );
  }
}
