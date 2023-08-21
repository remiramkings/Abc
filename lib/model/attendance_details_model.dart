import 'package:intl/intl.dart';

class AttendanceDetailsModel{
  String dailyReportMasterId;
  String companyId;
  String userId;
  String fullName;
  String designationName;
  String userLogoUuid;
  String reportDate;
  DateTime? checkInTime;
  DateTime? checkOutTime;
  String chechInOutDiff;
  String summary;
  String actionTypeId;
  String leaveType;
  String leaveRequestTypeName;
  String halfFullDay;
  String toDateStatusName;
  String sourse;
  String checkInLocation;
  String checkOutLocation;
  String approveStatus;
  String statusId;

  AttendanceDetailsModel({
    required this.dailyReportMasterId,
    required this.companyId,
    required this.userId,
    required this.fullName,
    required this.designationName,
    required this.userLogoUuid,
    required this.reportDate,
    required this.checkInTime,
    required this.checkOutTime,
    required this.chechInOutDiff,
    required this.summary,
    required this.actionTypeId,
    required this.leaveType,
    required this.leaveRequestTypeName,
    required this.halfFullDay,
    required this.toDateStatusName,
    required this.sourse,
    required this.checkInLocation,
    required this.checkOutLocation,
    required this.approveStatus,
    required this.statusId
  });

  static final DateFormat parserFormat = DateFormat('yyyy-MM-dd HH:mm:ss');

  static DateTime? getParsedDate(String? dateTime){
    if(dateTime == null){
      return null;
    }
    return parserFormat.parse(dateTime);
  }

  factory AttendanceDetailsModel.fromMap(Map<String, dynamic> map){
    return AttendanceDetailsModel(
      dailyReportMasterId: map['daily_report_master_id'] ?? "",
      companyId: map['company_id'] ?? "",
      userId: map['user_id'] ?? "",
      fullName: map['full_name'] ?? "",
      designationName: map['designation_name'] ?? "",
      userLogoUuid: map['user_logo_uuid'] ?? "",
      reportDate: map['report_date'] ?? "",
      checkInTime: getParsedDate(map['check_in_time']),
      checkOutTime: getParsedDate(map['check_out_time']),
      chechInOutDiff: map['chech_in_out_diff'] != null ? "${map['chech_in_out_diff']}": "",
      summary: map['summary'] ?? "",
      actionTypeId: map['action_type_id'] ?? "",
      leaveType: map['leave_type'] ?? "",
      leaveRequestTypeName: map['leave_request_type_name'] ?? "",
      halfFullDay: map['half_full_day'] ?? "",
      toDateStatusName: map['to_date_status_name'] ?? "",
      sourse: map['sourse'] ?? "",
      checkInLocation: map['check_in_location'] ?? "",
      checkOutLocation: map['check_out_location'] ?? "",
      approveStatus: map['approve_status'] ?? "",
      statusId: map['status_id'] ?? "");
  }
}