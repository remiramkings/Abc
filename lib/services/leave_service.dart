import 'dart:convert';

import 'package:http/http.dart';
import 'package:local_notification_project/model/leave_data.dart';
import 'package:local_notification_project/model/leave_grid_summary.dart';
import 'package:local_notification_project/model/leave_request_model.dart';
import 'package:local_notification_project/model/leave_response_model.dart';
import 'package:local_notification_project/services/base_service.dart';

class LeaveService extends BaseService{
  static final LeaveService _instance = LeaveService();

  static LeaveService getInstance(){
    return _instance;
  }

  Future<LeaveResponse?> getLeaves(LeaveRequestModel request) async {
    Uri uri = getApiUri('crm.todomor.com', 'api/getLeaveRequestbyId/6/463/0');
    var headers = {'Content-Type': 'application/json'};

    Response response = await client.put(uri, headers: headers, body: jsonEncode(request.toMap()));
    if(!isSuccess(response)){
      return null;
    }
    Map<String, dynamic> responseMap = getMap(response);
    if(!responseMap.containsKey('data') || !responseMap.containsKey('grid_summery')){
      return null;
    }

    List<LeaveData> data = (responseMap['data'] as List<dynamic>)
      .map((e) => LeaveData.fromMap( e as Map<String, dynamic>))
      .toList();
    
    List<dynamic> summaryArray = (responseMap['grid_summery'] as List<dynamic>);
    if(summaryArray.isEmpty){
      return null;
    }

    LeaveSummary summary = LeaveSummary.fromMap(summaryArray.first as Map<String, dynamic>);
    return LeaveResponse(
      data: data,
      summary: summary
    );
  }
  
}