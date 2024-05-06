import 'package:dio/dio.dart';

class ApiServices {
  final _baseurl = "https://";
  final Dio dio;
  ApiServices({required this.dio});

  Future<Response> dioGet({required String url, String? token}) async {
    dio.options = BaseOptions(
      receiveDataWhenStatusError: true,
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
      connectTimeout: const Duration(seconds: 60),
      contentType: "application/x-www-form-urlencoded",
      responseType: ResponseType.json,
      extra: <String, dynamic>{
        "Access-Control-Allow-Methods": "POST, OPTIONS, GET, PUT, DELETE",
      },
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        token != null ? 'Authorization' : 'Bearer $token': null
      },
    );
    return await dio.get(url);
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
  } /*Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get("$_baseurl$endpoint");
    return response.data;
  }*/
}
