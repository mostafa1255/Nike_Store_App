import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'package:nike_store_app/app/views/common_widgets/ToastMessage.dart';
import '../../data/manager/favorite_cubit/favorite_cubit.dart';

class FavoriteIconAction extends StatefulWidget {
  const FavoriteIconAction({Key? key, required this.favProduct})
      : super(key: key);
  final ProductsModel favProduct;

  @override
  _FavoriteIconActionState createState() => _FavoriteIconActionState();
}

class _FavoriteIconActionState extends State<FavoriteIconAction> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (isFavorite == false) {
          print("Added To Favorites");
          const ToastMessage(message: "Added To Favorites").showToast(context);
        }
        print("Added To ");
        BlocProvider.of<FavoriteCubit>(context)
            .addToFavoritesProducts(productsModel: widget.favProduct);
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      icon: Icon(
        isFavorite ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
        color: isFavorite ? Colors.red : null,
        size: 20,
      ),
    );
  }
}
