import 'package:flutter/material.dart';
import 'package:local_notification_project/attendance/attendance_item.dart';
import 'package:local_notification_project/model/attendance_model.dart';
import 'package:local_notification_project/services/attendance_service.dart';

class Attendance extends StatefulWidget {
  const Attendance({super.key});

  @override
  State<Attendance> createState() => _AttendanceState();
}

class _AttendanceState extends State<Attendance> {
  Future<AttendanceModel?>? attendanceFuture;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAttendance();
  }

  loadAttendance(){
    setState(() {
      attendanceFuture = AttendanceService.getInstance().getAttendanceDetails();
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Attendance'),
      ),
      body: Container(
        child: attendanceFuture == null ?
               const Text('') :
               FutureBuilder<AttendanceModel?>(
                future: attendanceFuture,
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting ||
                  snapshot.connectionState == ConnectionState.active){
                    return const Center(
                     child: CircularProgressIndicator.adaptive()
                    );
                  
                  }
                  AttendanceModel? attendance = snapshot.data;
                  if(attendance == null || attendance.result.isEmpty){
                    return const Center(
                      child: Text('No Data has found')
                    );
                  }
                  return ListView.builder(
                    itemCount: attendance.result.length,
                    itemBuilder: (context, index) {
                      return AttendanceItem(attendanceDetails: attendance.result[index]);
                    },
                  );
            
                },),
      ),
    );
  }
}