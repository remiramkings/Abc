import 'package:flutter/material.dart';
import 'package:local_notification_project/call_log_item.dart';
import 'package:local_notification_project/model/call_data.dart';
import 'package:local_notification_project/model/call_log_request_model.dart';
import 'package:local_notification_project/services/call_service.dart';

class CallLog extends StatefulWidget {
  const CallLog({super.key});

  @override
  State<CallLog> createState() => _CallLogState();
}

class _CallLogState extends State<CallLog> {
  Future<List<CallData>>? callLogsFuture;

  @override
  void initState() {
    super.initState();
    loadCallLog();
  }

  loadCallLog() {
    CallLogRequest request = CallLogRequest(
        companyId: "114",
        mode: "1172",
        branchId: "4",
        regionId: "1",
        year: 2023,
        month: 8,
        clientName: "",
        deliveryDate: "",
        updatedDate: "",
        assignedUser: ["1172"],
        tDate: "2023-8-5");
    setState(() {
      callLogsFuture = CallService.getInstance().getCallDetails(request);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call logs'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[200]),
        child: callLogsFuture == null
            ? const Text("")
            : FutureBuilder(
                future: callLogsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.active) {
                    return const Center(
                        child: CircularProgressIndicator.adaptive());
                  }
                  List<CallData>? logs = snapshot.data;
                  if (logs == null || logs.isEmpty) {
                    return const Center(
                      child: Text('No call logs'),
                    );
                  }

                  return ListView.builder(
                    itemCount: logs.length,
                    itemBuilder: (context, index) {
                      return CallLogItem(callData: logs[index]);
                    },
                  );
                },
              ),
      ),
    );
  }
}
