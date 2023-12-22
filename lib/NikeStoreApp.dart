import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nike_store_app/app/data/manager/auth%20cubits/register_Cubit/register_cubit.dart';
import 'app/router/app_router.dart';

class NikeStoreApp extends StatelessWidget {
  const NikeStoreApp({Key? key}) : super(key: key);

  double pxToDp(BuildContext context, double pixel) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return pixel / devicePixelRatio;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => RegisterCubit()),
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
