import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/core/Functions/setUp_Service_Locator.dart';
import 'package:nike_store_app/app/data/manager/cart_Quantity_cubit/cart_Quantity_cubit.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import 'package:nike_store_app/app/data/repos/home_rep/home_repo_impl.dart';
import '../../../core/styles/App_Colors.dart';
import '../../../data/repos/cart_repo/cart_repo_Impl.dart';
import 'widgets/BottomNavBarOfMyCartScreenBlocBuilder.dart';
import 'widgets/MyCartScreenBody.dart';
import 'widgets/cartScreenAppBar.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              CartCubit(cartRepo: CartRepoImpl(), homeRepo:  getIt.get<HomeRepoImpl>())
                ..getCartProducts(),
        ),
        BlocProvider(
          create: (context) => CartQuantityCubit(cartRepo: CartRepoImpl()),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: const BottomNavBarOfMyCartScreenBlocBuilder(),
        backgroundColor: AppColors.kOfWhiteColor,
        appBar: cartScreenAppBar(context),
        body: const MyCartScreenBody(),
      ),
    );
  }
}

