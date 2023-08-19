import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_notification_project/leave/add_leave.dart';
import 'package:local_notification_project/model/leave_data.dart';

class LeaveDrillDown extends StatefulWidget {
  LeaveData leaveData;
  LeaveDrillDown({super.key, required this.leaveData});

  @override
  State<LeaveDrillDown> createState() => _LeaveDrillDownState();
}

class _LeaveDrillDownState extends State<LeaveDrillDown> {
  DateFormat dparse = DateFormat("yyyy-MM-dd");
  DateFormat dformat = DateFormat("dd-MMM");
  DateFormat dAppParse = DateFormat("dd-MM-yyyy HH:mm:ss");
  DateFormat dAppFormat = DateFormat("dd-MM-yyyy hh:mm aaa");
  @override
  Widget build(BuildContext context) {
    var fromDate = dformat.format(dparse.parse(widget.leaveData.fromDate));
    var toDate = dformat.format(dparse.parse(widget.leaveData.toDate));
    var appliedDate = dAppFormat.format(dAppParse.parse(widget.leaveData.createdDate));
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        const Divider(thickness: 1, color: Colors.grey,),
        Text('Reason : ${widget.leaveData.reason}',
          style: const TextStyle(color: Colors.grey),
        ),
        Text(
            '$fromDate : ${widget.leaveData.fromDateStatusName}',
              style: const TextStyle(
                color: Colors.grey
              ),),
        Text(
            '$toDate : ${widget.leaveData.toDateStatusName}',
              style: const TextStyle(
                color: Colors.grey
              ),
            ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Text(widget.leaveData.leaveRequestStatusName, 
                  style: const TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.grey
                  ),)),
            InkWell(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => AddLeave(leaveData: widget.leaveData)
                  ),
                );
              },
              child: const Icon(Icons.edit, color: Colors.blue,),
            )
          ],
        ),
        Text('Applied Date : ${appliedDate}',
          style: const TextStyle(color: Colors.grey),
        ),
        Text('Comments : ${widget.leaveData.comment}',
          style: const TextStyle(color: Colors.grey),
        )
      ]),
    );
  }
}
