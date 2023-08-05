import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:local_notification_project/model/call_data.dart';

class CallLogDrillDown extends StatefulWidget {
  CallData callData;
  CallLogDrillDown({
    super.key,
    required this.callData
  });

  @override
  State<CallLogDrillDown> createState() => _CallLogDrillDownState();
}

class _CallLogDrillDownState extends State<CallLogDrillDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200]
      ),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.play_arrow_outlined)
            ],
          ),
          Text(widget.callData.callStatus),
          SizedBox(height: 10),
          widget.callData.callTypeId == 1 ? Text('Incoming') : Text('Outgoing')
        ],
      ),
    );
  }
}