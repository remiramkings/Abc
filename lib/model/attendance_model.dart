import 'package:local_notification_project/model/attendance_details_model.dart';

class AttendanceModel{
  String date;
  List<AttendanceDetailsModel> result;

  AttendanceModel({
    required this.date,
    required this.result
  });

  factory AttendanceModel.fromMap(Map<String, dynamic> map){
    return AttendanceModel(
      date: map['date'] ?? '',
      result: (map['result'] as List<dynamic>)
        .map((e) => AttendanceDetailsModel.fromMap(e as Map<String, dynamic>))
        .toList()
    );
  }
}