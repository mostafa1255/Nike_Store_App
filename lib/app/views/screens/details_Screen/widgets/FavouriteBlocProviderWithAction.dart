import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/manager/favorite_cubit/favorite_cubit.dart';
import '../../../../data/models/Products_Model.dart';
import '../../../../data/repos/home_rep/home_repo_impl.dart';
import '../../../common_widgets/FavoriteIconAction.dart';

class FavouriteBlocProviderWithAction extends StatelessWidget {
  const FavouriteBlocProviderWithAction({
    super.key,
    required this.productsModel,
  });

  final ProductsModel productsModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(homeRepo: HomeRepoImpl()),
      child: FavoriteIconAction(favProduct: productsModel),
    );
  }
}
