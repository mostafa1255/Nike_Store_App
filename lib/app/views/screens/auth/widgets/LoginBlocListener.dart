import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';

void loginBlocListener(context, state) {
  if (state is LoginSuccess) {
   // customsnackBar(context, "Login Successfully", Colors.green);
    GoRouter.of(context).push(Approuter.homescreen);
  } else if (state is LoginFailure) {
    customsnackBar(context, state.errMessage, Colors.red);
  } 
}
