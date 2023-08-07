import 'package:flutter/material.dart';
import 'package:local_notification_project/model/call_data.dart';
import 'package:local_notification_project/services/call_log_drilldown.dart';
import 'package:intl/intl.dart';

class CallLogItem extends StatefulWidget {
  CallData callData;
  CallLogItem({
    super.key,
    required this.callData
  });

  @override
  State<CallLogItem> createState() => _CallLogItemState();
}

class _CallLogItemState extends State<CallLogItem> {
  bool isActiveDrillDown = false;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime  = DateTime.parse(widget.callData.callDateTime);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(
          color: Colors.grey,
          width: 1
        ))
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text('${dateTime.year}', style: TextStyle(fontWeight: FontWeight.bold, ),),
                      
                      Text('${dateTime.day}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25 )),
                      
                      Text(DateFormat.MMM().format(dateTime), style: TextStyle(fontWeight: FontWeight.bold, ),)
                    ],
                  ),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.callData.fullName),
                      SizedBox(height: 5,),
                      Text(widget.callData.callNumber)
                    ],
                  ),
                ),
                Column(
                  children: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Icon(
                          isActiveDrillDown ? Icons.keyboard_arrow_up_outlined
                          : Icons.keyboard_arrow_down_outlined
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          isActiveDrillDown = !isActiveDrillDown;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: isActiveDrillDown,
            child: CallLogDrillDown(callData: widget.callData),
          )
        ],
      ),
    );
  }
}