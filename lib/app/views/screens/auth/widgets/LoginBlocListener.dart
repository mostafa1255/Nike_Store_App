import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is LoginSuccess) {
          customsnackBar(context, "Login Successfully", Colors.green);
          GoRouter.of(context).push(Approuter.homescreen);
        } else if (state is LoginFailure) {
          customsnackBar(context, state.errMessage, Colors.red);
        } else if (state is EmailVerificationFailure) {
          customsnackBar(context, state.errMessage, Colors.red);
        } else if (state is EmailVerificationLoading) {
          customsnackBar(context, state.errMessage, Colors.blue);
        }
      },
    );
  }
}
