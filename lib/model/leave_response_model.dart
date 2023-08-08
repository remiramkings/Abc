import 'package:local_notification_project/model/leave_data.dart';
import 'package:local_notification_project/model/leave_grid_summary.dart';

class LeaveResponse{
  List<LeaveData> data;
  LeaveSummary summary;

  LeaveResponse({
    required this.data,
    required this.summary
  });
}