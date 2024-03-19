import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import 'package:nike_store_app/app/data/manager/home_cubit/home_cubit.dart';
import 'package:nike_store_app/app/data/manager/user_cubit/user_cubit.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo_impl.dart';
import 'package:nike_store_app/app/data/repos/user_repo/user_repo_Impl.dart';
import 'widgets/HomeDrawer.dart';
import 'widgets/HomeScreenBody.dart';
import 'widgets/homeAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              HomeCubit(homeRepo: HomeRepoImpl())..getAllProducts(),
        ),
        BlocProvider(create: (context) => CartCubit(homeRepo: HomeRepoImpl())),
        BlocProvider(
            create: (context) =>
                UserCubit(userRepo: UserRepoImpl())..getUserData())
      ],
      child: Scaffold(
        backgroundColor: AppColors.kOfWhiteColor,
        drawer: const HomeDrawer(),
        appBar: homeAppBar(context),
        body: const HomeScreenBody(),
      ),
    );
  }
}
