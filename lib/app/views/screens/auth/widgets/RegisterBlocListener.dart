import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/Functions/Snack_Bar.dart';
import '../../../../data/manager/auth cubits/register_Cubit/register_cubit.dart';
import '../../../../router/app_router.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      child: const SizedBox.shrink(),
      listener: (context, state) {
        if (state is EmailVerificationSuccess) {
          customsnackBar(context, "Account Created Successfully", Colors.green);
          GoRouter.of(context).push(Approuter.homescreen);
        } else if (state is RegisterFailure) {
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
