import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiServices {
  static const _baseurl = "https://accept.paymob.com/api";
  static const String initPaymobUrl = "$_baseurl/auth/tokens";
  static const String orderPaymobUrl = "$_baseurl/ecommerce/orders";
  static const String getPaymobPaymentTokenUrl =
      "$_baseurl/acceptance/payment_keys";
  static const String paymobFrameUrl =
      "$_baseurl/acceptance/iframes/844444?payment_token=";
  final Dio dio;
  ApiServices({required this.dio});

  final PrettyDioLogger _logger = PrettyDioLogger(
    requestBody: true,
    responseBody: true,
    requestHeader: true,
    error: true,
  );
  Future<Response> dioGet(
      {required String url, String? token, dynamic data}) async {
    _logger;

    return await dio.get(url, data: data);
  }

  Future<Response> dioPost(
      {required String url,
      required dynamic data,
      Options? options,
      String? token}) async {
    _logger;
    return await dio.post(
      url,
      options: Options(headers: {
        'Content-Type': 'application/json',
      }),
      data: data,
    );
  } /*Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await dio.get("$_baseurl$endpoint");
    return response.data;
  }*/
}
/* dio.options = BaseOptions(
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
    );* */