import 'dart:convert';

import 'package:http/http.dart';
import 'package:local_notification_project/model/call_data.dart';
import 'package:local_notification_project/model/call_log_request_model.dart';
import 'package:local_notification_project/services/base_service.dart';

class CallService extends BaseService{
  static final CallService _instance = CallService();

  static CallService getInstance() {
    return _instance;
  }

  Future<List<CallData>> getCallDetails(CallLogRequest request) async {
    Uri uri = getApiUri('fibrcrm.com', 'api/get_Calllog_report_data/0/1165', isSecure: true);
    var headers = {'Content-Type': 'application/json'};

    Response response = await client.put(uri, headers: headers, body: jsonEncode(request.toRequest()));
    if(!isSuccess(response)){
      return [];
    }
    List<dynamic> responseList = getList(response);

    return responseList
      .map((e) => CallData.fromMap( e as Map<String, dynamic>))
      .toList();
  }
}
