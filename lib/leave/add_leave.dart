import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:local_notification_project/custom_date_picker.dart';
import 'package:local_notification_project/drop_down_component.dart';
import 'package:local_notification_project/model/from_date_status.dart';
import 'package:local_notification_project/model/leave_data.dart';
import 'package:local_notification_project/model/leave_details_response.dart';
import 'package:local_notification_project/model/leave_edit_request_model.dart';
import 'package:local_notification_project/model/leave_request_type.dart';
import 'package:local_notification_project/model/to_date_status.dart';
import 'package:local_notification_project/model/user_model.dart';
import 'package:local_notification_project/services/leave_service.dart';

class AddLeave extends StatefulWidget {
  LeaveData? leaveData;
  AddLeave({super.key,
    this.leaveData
  });

  @override
  State<AddLeave> createState() => _AddLeaveState();
}

class _AddLeaveState extends State<AddLeave> {

  int companyId = 6;
  int userId = 1745;

  TextEditingController reasonController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  Future<LeaveDetailsResponse?>? detailsFuture;
  Future<List<UserModel>>? userFuture;
  UserModel? selectedUser;
  LeaveRequestType? selectedLeaveRequestType;
  FromDateStatus? selectedFromDateStatus;
  ToDateStatus? selectedToDateStatus;
  DateTime fromDate = DateTime.now();
  DateTime toDate = DateTime.now();
  bool isEdit = false;
  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  @override
  void initState() {
    super.initState();
    setState(() {
      isEdit = widget.leaveData != null;
    });
    if(isEdit){
      populateEdit();
    }
    loadDetails();
    
  }

  populateEdit(){
    LeaveData data = widget.leaveData!;
    setState(() {
      selectedUser = UserModel(id: int.parse(data.userId), name: data.fullName);
      selectedLeaveRequestType = LeaveRequestType.fromLeaveData(data);
      selectedFromDateStatus = FromDateStatus.fromLeaveData(data);
      selectedToDateStatus = ToDateStatus.fromLeaveData(data);
      fromDate = DateTime.parse(data.fromDate);
      toDate = DateTime.parse(data.toDate);
      reasonController.text = data.reason;
      commentController.text = data.comment;
    });
  }

  loadDetails() {
    setState(() {
      detailsFuture = LeaveService.getInstance().getLeaveDetails();
      userFuture = LeaveService.getInstance().getUserDetails(companyId, userId);
    });
  }

  updateLeave() async {
    int lid = int.parse(widget.leaveData!.leaveRequestMasterId);
    LeaveEditRequestModel? response = await LeaveService
      .getInstance()
      .updateLeave(
        LeaveEditRequestModel(
          differenceInDays: getDuration(),
          comment: commentController.text,
          companyId: companyId,
          createdUserId: userId,
          fromDate: dateFormat.format(fromDate),
          leaveFromDateStatusId: selectedFromDateStatus!.id,
          leaveRequestMasterId: lid,
          leaveRequestStatusId: int.parse(widget.leaveData!.leaveRequestStatusId),
          leaveRequestTypeId: selectedLeaveRequestType!.id,
          leaveToDateStatusId: selectedToDateStatus!.id,
          lid: lid,
          reason: reasonController.text,
          statusId: int.parse(widget.leaveData!.statusId),
          toDate: dateFormat.format(toDate),
          userId: userId
        )
      );
    String message = (response == null)
      ? "Cannot save changes"
      : "Leave data changed";

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );

    LeaveData newLeaveData = widget.leaveData!;
    if(response != null){
      newLeaveData.comment = response.comment;
      newLeaveData.differenceInDays = "${response.differenceInDays}";
      newLeaveData.fromDate = response.fromDate;
      newLeaveData.fromDateStatusName = selectedFromDateStatus!.name;
      newLeaveData.leaveFromDateStatusId = "${response.leaveFromDateStatusId}";
      newLeaveData.leaveRequestTypeId = "${response.leaveRequestTypeId}";
      newLeaveData.leaveRequestTypeName = selectedLeaveRequestType!.name;
      newLeaveData.leaveToDateStatusId = "${response.leaveToDateStatusId}";
      newLeaveData.toDate = response.toDate;
      newLeaveData.reason = response.reason;
      newLeaveData.toDateStatusName = selectedToDateStatus!.name;
    }

    Navigator.pop<LeaveData>(context, newLeaveData);
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
          children: [
            const Expanded(
              flex: 1,
              child: Text('Add Leave'),
            ),
            InkWell(
              child: Text(isEdit ? 'Edit': 'Save',
              style: const TextStyle(fontSize: 15)),
              onTap: (){
                    if(isEdit){
                      updateLeave();
                    }
                },
              )
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
                    FutureBuilder<List<UserModel>>(
                      future: userFuture,
                      builder: (_, userSnapshot) {
                        
                        return Expanded(
                            flex: 1,
                            child: CustomDropDown<UserModel>(
                              title: 'User',
                              options: userSnapshot.data ?? [],
                              optionLabel: "Users",
                              selected: selectedUser,
                              onSelected: (option) {
                                setState(() {
                                  selectedUser = option;
                                });
                              },
                            ));
                      }
                    ),
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
                        firstDate: fromDate,
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
                  controller: reasonController,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                  maxLines: 3,
                ),
                const SizedBox(height: 10),
                const Text('Comments'),
                TextFormField(
                  controller: commentController,
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
