import 'dart:convert';

import 'package:http/http.dart';
import 'package:local_notification_project/model/from_date_status.dart';
import 'package:local_notification_project/model/leave_data.dart';
import 'package:local_notification_project/model/leave_details_response.dart';
import 'package:local_notification_project/model/leave_edit_request_model.dart';
import 'package:local_notification_project/model/leave_grid_summary.dart';
import 'package:local_notification_project/model/leave_request_model.dart';
import 'package:local_notification_project/model/leave_request_status.dart';
import 'package:local_notification_project/model/leave_request_type.dart';
import 'package:local_notification_project/model/leave_response_model.dart';
import 'package:local_notification_project/model/to_date_status.dart';
import 'package:local_notification_project/model/user_model.dart';
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

  Future<LeaveDetailsResponse?> getLeaveDetails() async {
    Uri uri = getApiUri('crm.todomor.com', 'api/GetLeaveDDs/6');
    var headers = {'Content-Type': 'application/json'};

    Response response = await client.get(uri, headers: headers);
    if(!isSuccess(response)){
      return null;
    }

    Map<String, dynamic> responseMap = getMap(response);

    List<LeaveRequestType> leaveRequestTypes = [];
    List<FromDateStatus> fromDateStatuses = [];
    List<ToDateStatus> toDateStatuses = [];
    List<LeaveRequestStatus> leaveRequestStatuses = [];

    if(responseMap.containsKey('Leave_request_type')){
      leaveRequestTypes = (responseMap['Leave_request_type'] as List<dynamic>)
      .map((e) => LeaveRequestType.fromMap( e as Map<String, dynamic>))
      .toList();
    }

    if(responseMap.containsKey('from_date_status')){
      fromDateStatuses = (responseMap['from_date_status'] as List<dynamic>)
      .map((e) => FromDateStatus.fromMap( e as Map<String, dynamic>))
      .toList();
    }

    if(responseMap.containsKey('to_date_status')){
      toDateStatuses = (responseMap['to_date_status'] as List<dynamic>)
      .map((e) => ToDateStatus.fromMap( e as Map<String, dynamic>))
      .toList();
    }

    if(responseMap.containsKey('leave_request_status')){
      leaveRequestStatuses = (responseMap['leave_request_status'] as List<dynamic>)
      .map((e) => LeaveRequestStatus.fromMap( e as Map<String, dynamic>))
      .toList();
    }

    return LeaveDetailsResponse(
      leaveRequestTypes: leaveRequestTypes,
      fromDateStatuses: fromDateStatuses,
      toDateStatuses: toDateStatuses,
      leaveRequestStatuses: leaveRequestStatuses
    );
  }

  Future<LeaveEditRequestModel?> updateLeave(LeaveEditRequestModel request) async{
    Uri uri = getApiUri('crm.todomor.com','api/UpdateLeaveRequest');
    var headers = {'Content-Type': 'application/json'};

    Response response = await client.put(uri,
      headers: headers,
      body: jsonEncode(request.toMap())
    );

    if(!isSuccess(response)){
      return null;
    }

    Map<String, dynamic> responseMap = getMap(response);
    return LeaveEditRequestModel.fromMap(responseMap);
  }

// cid:6 uid=1745
  Future<List<UserModel>> getUserDetails(int companyId, int userId) async{
    Uri uri = getApiUri('crm.todomor.com', 'api/GetAssignedusers/$companyId/$userId/client');
    var headers = {'Content-Type': 'application/json'};
    Response response = await client.get(uri , headers: headers);

    if(!isSuccess(response)){
      return [];
    }

    List<dynamic> responseList =  getList(response);

    return responseList
      .map((e) => UserModel.fromMap(e as Map<String, dynamic>))
      .toList();
  
  }
}