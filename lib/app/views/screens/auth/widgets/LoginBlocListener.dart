import 'package:nike_store_app/app/data/manager/user_cubit/user_cubit.dart';
import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';

void loginBlocListener(context, state) async {
  if (state is LoginSuccess) {
    GoRouter.of(context).pushReplacement(Approuter.homescreen);
    await BlocProvider.of<UserCubit>(context).getUserData();
  } else if (state is LoginFailure) {
    customsnackBar(context, state.errMessage, Colors.red);
  }
}
