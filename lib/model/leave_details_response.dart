import 'package:local_notification_project/model/from_date_status.dart';
import 'package:local_notification_project/model/leave_request_status.dart';
import 'package:local_notification_project/model/leave_request_type.dart';
import 'package:local_notification_project/model/to_date_status.dart';

class LeaveDetailsResponse{
  List<LeaveRequestType> leaveRequestTypes;
  List<FromDateStatus> fromDateStatuses;
  List<ToDateStatus> toDateStatuses;
  List<LeaveRequestStatus> leaveRequestStatuses;

  LeaveDetailsResponse({
    required this.leaveRequestTypes,
    required this.fromDateStatuses,
    required this.toDateStatuses,
    required this.leaveRequestStatuses,
  });
}