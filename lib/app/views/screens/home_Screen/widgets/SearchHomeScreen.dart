import 'package:flutter/material.dart';
import 'package:nike_store_app/app/data/models/Products_Model.dart';
import 'SavedItemsResultFutuBuilderWidget.dart';
import 'SearchFilteredResultWidget.dart';

class SearchHomeScreen extends SearchDelegate {
  final List<ProductsModel>? shoesProducts;
  List<String>? filterList;

  SearchHomeScreen(
      {super.searchFieldLabel,
      super.searchFieldStyle,
      super.searchFieldDecorationTheme,
      super.keyboardType,
      super.textInputAction,
      required this.shoesProducts});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    if (!filterList!.contains(query.toLowerCase())) {
      return const Center(child: Text("No Results Found"));
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const SavedItemsResultFutuBuilderWidget();
    } else {
      filterList = shoesNamesList()
          .where((element) =>
              element.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
      return SearchFilteredResultWidget(filterList: filterList);
    }
  }

  List<String> shoesNamesList() {
    List<String> names = [];
    for (int i = 0; i < shoesProducts!.length; i++) {
      names.add(shoesProducts![i].name!);
    }
    return names;
  }
}
