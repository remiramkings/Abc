import 'package:local_notification_project/model/leave_data.dart';
import 'package:local_notification_project/model/leave_detail_base.dart';

class FromDateStatus extends LeaveDetailBase{

  FromDateStatus({
    required super.id,
    required super.name,
    required super.companyId,
    required super.statusId
  });

  factory FromDateStatus.fromMap(Map<String, dynamic> map){
    return FromDateStatus(
      id: map["leave_from_date_status_id"] ?? 0,
      name: map["from_date_status_name"] ?? "",
      companyId: map["company_id"] ?? 0,
      statusId: map["status_id"] ?? 0,
    );
  }

  factory FromDateStatus.fromLeaveData(LeaveData data){
    return FromDateStatus(
      id: int.parse(data.leaveFromDateStatusId),
      name: data.fromDateStatusName,
      companyId: int.parse(data.companyId),
      statusId: 0,
    );
  }
}