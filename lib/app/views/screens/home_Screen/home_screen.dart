import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:nike_store_app/app/core/Functions/setUp_Service_Locator.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import 'package:nike_store_app/app/data/manager/home_cubits/OutDoor_cubit/out_door_cubit.dart';
import 'package:nike_store_app/app/data/manager/home_cubits/home_cubit.dart';
import 'package:nike_store_app/app/data/manager/home_cubits/new_arrivals/new_arrivals_cubit.dart';
import 'package:nike_store_app/app/data/manager/home_cubits/tennis_cubit/tennis_cubit.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo_impl.dart';
import '../../../data/manager/user_cubit/user_cubit.dart';
import '../../../data/repos/cart_repo/cart_repo_Impl.dart';
import 'widgets/HomeDrawer.dart';
import 'widgets/HomeScreenBody.dart';
import 'widgets/homeAppBar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<UserCubit>(context).getUserData();
    return MultiBlocProvider(
      providers: multiBlocProvidersHomeScreen,
      child: Scaffold(
        backgroundColor: AppColors.kOfWhiteColor,
        drawer: const HomeDrawer(),
        appBar: homeAppBar(context),
        body: const HomeScreenBody(),
      ),
    );
  }

  List<SingleChildWidget> get multiBlocProvidersHomeScreen {
    return [
      BlocProvider(
        create: (context) =>
            HomeCubit(homeRepo: getIt.get<HomeRepoImpl>())..getAllProducts(),
      ),
      BlocProvider(
          create: (context) => CartCubit(
              cartRepo: CartRepoImpl(), homeRepo: getIt.get<HomeRepoImpl>())),
      BlocProvider(
          create: (context) =>
              NewArrivalsCubit(homeRepo: getIt.get<HomeRepoImpl>())
                ..newArrivalsProducts()),
      BlocProvider(
          create: (context) => TennisCubit(homeRepo: getIt.get<HomeRepoImpl>())
            ..fetchTennisProducts()),
      BlocProvider(
          create: (context) => OutDoorCubit(homeRepo: getIt.get<HomeRepoImpl>())
            ..outDoorProducts()),
    ];
  }
}
