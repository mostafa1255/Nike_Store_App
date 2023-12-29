import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/data/manager/auth%20cubits/login_Cubit/login_cubit.dart';
import 'package:nike_store_app/app/data/manager/auth%20cubits/register_Cubit/register_cubit.dart';
import 'package:nike_store_app/app/data/repos/login_Repo/login_repo_Impl.dart';
import 'package:nike_store_app/app/data/repos/register_Repo/register_repo_Imp.dart';
import 'app/router/app_router.dart';

class NikeStoreApp extends StatelessWidget {
  const NikeStoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit(RegisterRepoImpl())),
        BlocProvider(create: (_) => LoginCubit(LoginRepoImpl())),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: false,
        builder: (_, child) {
          return MaterialApp.router(
            routerConfig: Approuter.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
/*double pxToDp(BuildContext context, double pixel) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return pixel / devicePixelRatio;
  } */