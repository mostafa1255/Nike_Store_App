import 'package:nike_store_app/app/data/manager/user_cubit/user_cubit.dart';

import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';

void loginBlocListener(context, state) {
  if (state is LoginSuccess) {
    print("*" * 20);
    print("Login Success");
    BlocProvider.of<UserCubit>(context).getUserData();
    GoRouter.of(context).pushReplacement(Approuter.homescreen);
  } else if (state is LoginFailure) {
    customsnackBar(context, state.errMessage, Colors.red);
  }
}
