import 'package:local_notification_project/model/leave_data.dart';
import 'package:local_notification_project/model/leave_detail_base.dart';

class ToDateStatus extends LeaveDetailBase {

  ToDateStatus({
    required super.id,
    required super.name,
    required super.companyId,
    required super.statusId,
  });
  
  factory ToDateStatus.fromMap(Map<String, dynamic> map){
    return ToDateStatus(
      id: map['leave_to_date_status_id'] ?? 0,
      name: map['to_date_status_name'] ?? '',
      companyId: map['company_id'] ?? 0,
      statusId: map['status_id'] ?? 0
    );
  }

  factory ToDateStatus.fromLeaveData(LeaveData data){
    return ToDateStatus(
      id: int.parse(data.leaveToDateStatusId),
      name: data.toDateStatusName,
      companyId: int.parse(data.companyId),
      statusId: 0
    );
  }
}