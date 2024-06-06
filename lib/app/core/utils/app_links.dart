import 'package:nike_store_app/app/core/utils/global_variable.dart';
import 'package:nike_store_app/app/core/utils/paymob_Keys.dart';

class AppLinks {
  static const String url =
      "https://maps.googleapis.com/maps/api/directions/json?origin=${GloblaVariable.korigin}&destination=${GloblaVariable.kdistination}&key=${ApiKeys.apikey}";
}
