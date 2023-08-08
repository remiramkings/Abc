import 'package:flutter/material.dart';
import 'package:local_notification_project/leave/custom_tabbar.dart';
import 'package:local_notification_project/leave/leave_item.dart';
import 'package:local_notification_project/model/leave_request_model.dart';
import 'package:local_notification_project/model/leave_response_model.dart';
import 'package:local_notification_project/services/leave_service.dart';

class Leave extends StatefulWidget {
  const Leave({super.key});

  @override
  State<Leave> createState() => _LeaveState();
}

class _LeaveState extends State<Leave> {
  Future<LeaveResponse?>? leaveFuture;
  int selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    loadLeaves();
  }

  onChangeTabIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
    loadLeaves();
  }

  loadLeaves() {
    setState(() {
      leaveFuture = LeaveService.getInstance()
          .getLeaves(LeaveRequestModel.createDefault(selectedIndex));
    });
  }

  @override
  Widget build(BuildContext context) {
    return leaveFuture == null
        ? const Text("")
        : FutureBuilder<LeaveResponse?>(
            future: leaveFuture,
            builder: (context, snapshot) {
              bool isLoading =
                  snapshot.connectionState == ConnectionState.waiting ||
                      snapshot.connectionState == ConnectionState.active;

              LeaveResponse? response = snapshot.data;
              return Scaffold(
                appBar: AppBar(
                  leading: const Icon(Icons.arrow_back),
                  title: const Text('Leaves'),
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(37),
                      child: CustomTabBar(
                        summary: response != null ? response.summary : null,
                        selectedIndex: selectedIndex,
                        onSelected: onChangeTabIndex,
                      )),
                ),
                body: Container(
                  decoration: BoxDecoration(color: Colors.grey[200]),
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : response == null
                          ? const Center(child: Text("No Leaves"))
                          : ListView.builder(
                              itemCount: response.data.length,
                              itemBuilder: (context, index) {
                                return LeaveItem(
                                    leaveData: response.data[index]);
                              },
                            ),
                ),
              );
              
            },
          );
  }
}
