import 'package:local_notification_project/model/common_id_name.dart';

class LeaveDetailBase extends CommonIdName{
  
  int companyId;
  int statusId;

  LeaveDetailBase({
    required super.id,
    required super.name,
    required this.companyId,
    required this.statusId
  });
}