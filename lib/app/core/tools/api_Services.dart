import 'package:dio/dio.dart';

class ApiServices {
  final _baseurl = "https://";
  final Dio dio;
  ApiServices({required this.dio});
  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get("$_baseurl$endpoint");
    return response.data;
  }

  Future<void> post(
      {required String url,
      required dynamic data,
      required Options options}) async {
    try {
      await dio.post(url, data: data, options: options);
    } catch (error) {
      print('Error: $error');
    }
  }
}
