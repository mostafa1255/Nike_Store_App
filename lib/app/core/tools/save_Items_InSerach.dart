import 'package:shared_preferences/shared_preferences.dart';

class SaveSearchProducts {
  static Future<void> saveItems(List<String> items) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('searchProducts', items);
  }

  static Future<List<String>> getItems() async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList('searchProducts') ?? [];
    return items;
  }
}
