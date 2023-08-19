class LeaveEditRequestModel {
  int differenceInDays;
  String comment;
  int companyId;
  int createdUserId;
  String fromDate;
  int leaveFromDateStatusId;
  int leaveRequestMasterId;
  int leaveRequestStatusId;
  int leaveRequestTypeId;
  int leaveToDateStatusId;
  int lid;
  String reason;
  int statusId;
  String toDate;
  int userId;

  LeaveEditRequestModel(
      {required this.differenceInDays,
      required this.comment,
      required this.companyId,
      required this.createdUserId,
      required this.fromDate,
      required this.leaveFromDateStatusId,
      required this.leaveRequestMasterId,
      required this.leaveRequestStatusId,
      required this.leaveRequestTypeId,
      required this.leaveToDateStatusId,
      required this.lid,
      required this.reason,
      required this.statusId,
      required this.toDate,
      required this.userId});

  Map<String, dynamic> toMap() {
    return ({
      "Difference_In_Days": differenceInDays,
      "comment": comment,
      "company_id": companyId,
      "created_user_id": createdUserId,
      "from_date": fromDate,
      "leave_from_date_status_id": leaveFromDateStatusId,
      "leave_request_master_id": leaveRequestMasterId,
      "leave_request_status_id": leaveRequestStatusId,
      "leave_request_type_id": leaveRequestTypeId,
      "leave_to_date_status_id": leaveToDateStatusId,
      "lid": lid,
      "reason": reason,
      "status_id": statusId,
      "to_date": toDate,
      "user_id": userId
    });
  }

  factory LeaveEditRequestModel.fromMap(Map<String, dynamic> map) {
    return LeaveEditRequestModel(
      differenceInDays: map['Difference_In_Days'],
      comment: map['comment'],
      companyId: map['company_id'],
      createdUserId: map['created_user_id'],
      fromDate: map['from_date'],
      leaveFromDateStatusId: map['leave_from_date_status_id'],
      leaveRequestMasterId: map['leave_request_master_id'],
      leaveRequestStatusId: map['leave_request_status_id'],
      leaveRequestTypeId: map['leave_request_type_id'],
      leaveToDateStatusId: map['leave_to_date_status_id'],
      lid: map['lid'],
      reason: map['reason'],
      statusId: map['status_id'],
      toDate: map['to_date'],
      userId: map['user_id']
    );
  }
}
