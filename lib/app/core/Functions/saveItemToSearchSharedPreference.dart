import '../tools/save_Items_InSerach.dart';

void saveItemToSearchSharedPreference({required String item}) {
  SaveSearchProducts.getItems().then((items) {
    items.add(item);
    SaveSearchProducts.saveItems(items);
  });
}
