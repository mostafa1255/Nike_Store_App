import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../core/tools/reg_imp.dart';
import '../../../../core/tools/remote_notification_sevices.dart';
import '../../../../data/manager/auth cubits/login_Cubit/login_cubit.dart';

void loginBlocListener(context, state) async {
  if (state is LoginSuccess) {
    GoRouter.of(context).pushReplacement(Approuter.homescreen);
    RemoteNotificationService.actionWhenFcmMessageReceivedInBackground(
        context: context);
    RemoteNotificationService.actionWhenFcmMessageReceivedInTerminated(
        context: context);
  } else if (state is LoginFailure) {
    customsnackBar(context, state.errMessage, Colors.red);
  }
}
