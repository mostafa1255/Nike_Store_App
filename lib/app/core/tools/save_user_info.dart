import 'package:shared_preferences/shared_preferences.dart';

class SaveUserInfo {
  static Future<void> saveUserLatitude(String lat) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("lat", lat);
  }

  static Future<String?> getUserLatitude() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("lat");
  }

  static Future<void> saveUserLongitude(String long) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("long", long);
  }

  static Future<String?> getUserLongitude() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("long") ?? "";
  }

  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("email", email);
  }

  // Get user email from shared preferences
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email") ?? "";
  }

  // Save user phone to shared preferences
  static Future<void> saveUserPhone(String phone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("phone", phone);
  }

  // Get user phone from shared preferences
  static Future<String?> getUserPhone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("phone");
  }

  // Save user name to shared preferences
  static Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", name);
  }

  static Future<void> saveUserImageUrl(String imageUrl) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("imageUrl", imageUrl);
  }

  static Future<String?> getUserImageUrl() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("imageUrl");
  }

  // Get user name from shared preferences
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("name");
  }

  static Future<void> saveUserUid(String uid) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("uid", uid);
  }

  // Get user UID from shared preferences
  static Future<String?> getUserUid() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("uid");
  }

  static Future<void> deleteUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("email");
    await prefs.remove("phone");
    await prefs.remove("name");
    await prefs.remove("uid");
    await prefs.remove("lat");
    await prefs.remove("long");
  }
}
