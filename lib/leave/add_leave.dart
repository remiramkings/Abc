import 'package:flutter/material.dart';
import 'package:local_notification_project/custom_date_picker.dart';
import 'package:local_notification_project/drop_down_component.dart';
import 'package:local_notification_project/model/from_date_status.dart';
import 'package:local_notification_project/model/leave_details_response.dart';
import 'package:local_notification_project/model/leave_request_type.dart';
import 'package:local_notification_project/model/to_date_status.dart';
import 'package:local_notification_project/model/user_model.dart';
import 'package:local_notification_project/services/leave_service.dart';

class AddLeave extends StatefulWidget {
  const AddLeave({super.key});

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> {
  Future<LeaveDetailsResponse?>? detailsFuture;
  String? selectedUserType;
  UserModel? selectedUser;
  LeaveRequestType? selectedLeaveRequestType;
  FromDateStatus? selectedFromDateStatus;
  ToDateStatus? selectedToDateStatus;
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    loadDetails();
  }

  loadDetails() {
    setState(() {
      detailsFuture = LeaveService.getInstance().getLeaveDetails();
    });
  }

  int getDuration() {
    Duration duration = toDate.difference(fromDate);
    return duration.inDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            child: const Icon(Icons.arrow_back),
            onTap: () {
              Navigator.pop(context);
            }),
        title: Row(
          children: const [
            Expanded(
              flex: 1,
              child: Text('Leaves'),
            ),
            Text('SAVE', style: TextStyle(fontSize: 15))
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: FutureBuilder(
        future: detailsFuture,
        builder: (context, snapshot) {
          LeaveDetailsResponse? details = snapshot.data;
          return Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: CustomDropDown<UserModel>(
                          title: 'User',
                          options: [
                            UserModel(id: 1, name: 'Sajith'),
                            UserModel(id: 2, name: 'Jack Sparrow')
                          ],
                          optionLabel: "Users",
                          selected: selectedUser,
                          onSelected: (option) {
                            setState(() {
                              selectedUser = option;
                            });
                          },
                        )),
                    const SizedBox(width: 15),
                    Expanded(
                        flex: 1,
                        child: CustomDropDown<LeaveRequestType>(
                          title: 'Type',
                          options: details == null ? [] : details.leaveRequestTypes,
                          optionLabel: "Types",
                          selected: selectedLeaveRequestType,
                          onSelected: (option) {
                            setState(() {
                              selectedLeaveRequestType = option;
                            });
                          },
                        ))
                  ],
                ),
                SizedBox(height: 15),
                Row(children: [
                  Expanded(
                      flex: 1,
                      child: CustomDatePicker(
                        label: 'From Date',
                        selected: fromDate,
                        firstDate: DateTime.now(),
                        onSelected: (date) {
                          setState(() {
                            fromDate = date;
                            if(toDate.difference(fromDate).isNegative){
                              toDate = date;
                            }
                          });
                        },
                      ),
                    ),                  const SizedBox(width: 15),
                  Expanded(
                      flex: 1,
                      child: CustomDropDown<FromDateStatus>(
                        options: details == null ? [] : details.fromDateStatuses,
                        optionLabel: "Status",
                        selected: selectedFromDateStatus,
                        onSelected: (option) {
                          setState(() {
                            selectedFromDateStatus = option;
                          });
                        },
                        title: 'From Status',
                      ))
                ]),
                const SizedBox(height: 15),
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: CustomDatePicker(
                        label: 'To Date',
                        selected: toDate,
                        firstDate: fromDate,
                        onSelected: (date) {
                          setState(() {
                            toDate = date;
                          });
                        },
                      )),
                  const SizedBox(width: 15),
                  Expanded(
                      flex: 1,
                      child: CustomDropDown<ToDateStatus>(
                        options: details == null ? [] : details.toDateStatuses,
                        optionLabel: "Status",
                        selected: selectedToDateStatus,
                        onSelected: (option) {
                          setState(() {
                            selectedToDateStatus = option;
                          });
                        },
                        title: 'To Status',
                      ))
                ]),
                const SizedBox(height: 15),
                const Text('Total Days'),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  width: 180,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1, color: Colors.grey))),
                  child: Text('${getDuration()}'),
                ),
                const SizedBox(height: 15),
                const Text('Reason'),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                const Text('Comments'),
                TextFormField(
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 3,
                ),
              ],
            ),
          );
        },
      )),
    );
  }
}
