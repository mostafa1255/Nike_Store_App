import 'dart:math';

String generateUniqueOrderId() {
  String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
  String randomString = _getRandomString(6);
  return '$timestamp$randomString';
}

String _getRandomString(int length) {
  const charset = 'abcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  return List.generate(
      length, (index) => charset[random.nextInt(charset.length)]).join();
}
