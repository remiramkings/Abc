import 'package:local_notification_project/model/leave_detail_base.dart';

class LeaveRequestType extends LeaveDetailBase{
  String leaveRequestShortCode;
  String leaveRequestColor;

  LeaveRequestType({
    required super.id,
    required super.name,
    required super.companyId,
    required super.statusId,
    required this.leaveRequestShortCode,
    required this.leaveRequestColor
  });

  factory LeaveRequestType.fromMap(Map<String, dynamic> map){
    return LeaveRequestType(
      id: map['leave_request_type_id'] ?? 0,
      name: map['leave_request_type_name'] ?? '',
      companyId: map['company_id'] ?? 0,
      statusId: map['status_id'] ?? 0,
      leaveRequestShortCode: map['leave_request_short_code'] ?? '',
      leaveRequestColor: map['leave_request_color'] ?? ''
    );
  }
}