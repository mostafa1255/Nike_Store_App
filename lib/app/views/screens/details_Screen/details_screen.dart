import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/core/Functions/setUp_Service_Locator.dart';
import 'package:nike_store_app/app/core/styles/App_Colors.dart';
import 'package:nike_store_app/app/data/manager/cart_Cubit/cart_cubit.dart';
import 'package:nike_store_app/app/data/repos/cart_repo/cart_repo_Impl.dart';
import 'package:nike_store_app/app/views/screens/details_Screen/widgets/DetailsScreenBody.dart';
import '../../../data/models/Products_Model.dart';
import '../../../data/repos/home_rep/home_repo_impl.dart';
import 'widgets/detailsScreenAppBar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.productsModel});
  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CartCubit(cartRepo: CartRepoImpl(), homeRepo:  getIt.get<HomeRepoImpl>()),
      child: Scaffold(
        backgroundColor: AppColors.kOfWhiteColor,
        appBar: detailsScreenAppBar(context),
        body: DetailsScreenBody(
          productsModel: productsModel,
        ),
      ),
    );
  }
}
