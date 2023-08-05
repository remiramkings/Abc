import 'dart:convert';
import 'package:http/http.dart';

class BaseService {

  Client get client {
    return Client();
  }
  
  List<dynamic> getList(Response response) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  Map<String, dynamic> getMap(Response response) {
    return jsonDecode(utf8.decode(response.bodyBytes));
  }

  bool isSuccess(Response response) {
    return response.statusCode >= 200 && response.statusCode < 300;
  }

  Uri getApiUri(String endpoint, {Map<String, dynamic>? queryParams}) {
    return Uri.https("fibrcrm.com","/$endpoint", queryParams);
  }

}