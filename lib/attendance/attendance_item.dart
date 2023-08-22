import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_notification_project/model/attendance_details_model.dart';

class AttendanceItem extends StatelessWidget {
  AttendanceDetailsModel attendanceDetails;
  AttendanceItem({super.key, required this.attendanceDetails});
  static final DateFormat timeFormat = DateFormat('HH:mm');

  Map<String, int> getAttendanceDuration(){
    int interval = int.parse(attendanceDetails.chechInOutDiff);
    return {
      'hours': (interval ~/ 60).round(),
      'minutes': interval%60
    };
  }

  static String getFormattedTime(DateTime? dateTime){
    if(dateTime == null){
      return '';
    }
    return timeFormat.format(dateTime);
  }



  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(attendanceDetails.reportDate);
    Map<String, int> durationMap = getAttendanceDuration();
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        children: [
                          Text(
                            '${dateTime.year}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(179, 255, 193, 59)),
                          ),
                          Text(DateFormat("dd").format(dateTime),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                  color: Color.fromARGB(205, 22, 48, 167))),
                          Text(
                            DateFormat.MMM().format(dateTime).toUpperCase(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 179, 37, 56)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 5),
                Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(attendanceDetails.fullName,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        Text(
                          'On Duty - ${getFormattedTime(attendanceDetails.checkInTime)}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(205, 22, 48, 167),
                              fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          attendanceDetails.checkInLocation,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Off Duty - ${getFormattedTime(attendanceDetails.checkOutTime)}',
                          style: const TextStyle(
                              color: Colors.pink,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '${attendanceDetails.checkOutLocation}',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                        )
                      ],
                    )),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${durationMap['hours']}',
                                style:const TextStyle(color: Colors.grey,
                                  fontWeight: FontWeight.bold  )
                              ),
                              const TextSpan(
                                text: ' Hr',
                                style: TextStyle(color: Color.fromARGB(255, 179, 37, 56),
                                  fontWeight: FontWeight.bold  )
                              )
                            ]
                          )
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${durationMap['minutes']}',
                                style: const TextStyle(color: Colors.grey,
                                  fontWeight: FontWeight.bold  )
                              ),
                              const TextSpan(
                                text: ' Min',
                                style: TextStyle(color: Colors.green,
                                  fontWeight: FontWeight.bold  )
                              )
                            ]
                          )
                        ),
                      ],
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
