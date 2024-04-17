import 'package:dio/dio.dart';
import 'faliure.dart';

class ServerFaliure extends Faliures {
  ServerFaliure(super.errmessage);

  factory ServerFaliure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFaliure('Connection timeout with ApiServer');
      case DioErrorType.connectionError:
        return ServerFaliure("Bad Connection , Please try Again Later");
      case DioErrorType.sendTimeout:
        return ServerFaliure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFaliure('Receive timeout with ApiServer');
      case DioErrorType.badResponse:
        return ServerFaliure.fromResponse(
            dioError.response!.data!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFaliure('Request to ApiServer was canceld');
      case DioErrorType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFaliure('No Internet Connection');
        }
        return ServerFaliure('Unexpected Error, Please try again!');
      default:
        return ServerFaliure('Opps There was an Error, Please try again');
    }
  }
  factory ServerFaliure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFaliure(response["error"]["message"]);
    } else if (statusCode == 404) {
      return ServerFaliure("Requist Not Found");
    } else if (statusCode == 500) {
      return ServerFaliure("Error in Server , Please Try Again Later");
    } else {
      return ServerFaliure("Opps There is an Error");
    }
  }
}
