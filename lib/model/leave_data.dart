class LeaveData{
  String leaveRequestMasterId;
  String leaveRequestTypeId;
  String leaveRequestTypeName;
  String fromDate;
  String toDate;
  String differenceInDays;
  String reason;
  String statusId;
  String companyId;
  String comment;
  String userId;
  String fullName;
  String designationName;
  String leaveRequestStatusId;
  String leaveRequestStatusName;
  String leaveFromDateStatusId;
  String createdDate;
  String fromDateStatusName;
  String leaveToDateStatusId;
  String toDateStatusName;

  LeaveData({
    required this.leaveRequestMasterId,
      required this.leaveRequestTypeId,
      required this.leaveRequestTypeName,
      required this.fromDate,
      required this.toDate,
      required this.differenceInDays,
      required this.reason,
      required this.statusId,
      required this.companyId,
      required this.comment,
      required this.userId,
      required this.fullName,
      required this.designationName,
      required this.leaveRequestStatusId,
      required this.leaveRequestStatusName,
      required this.leaveFromDateStatusId,
      required this.createdDate,
      required this.fromDateStatusName,
      required this.leaveToDateStatusId,
      required this.toDateStatusName
  });

  factory LeaveData.fromMap(Map<String, dynamic> map){
    return LeaveData(
      leaveRequestMasterId: map['leave_request_master_id'] ?? '',
      leaveRequestTypeId: map['leave_request_type_id'] ?? '',
      leaveRequestTypeName: map['leave_request_type_name'] ?? '',
      fromDate: map['from_date'] ?? '',
      toDate: map['to_date'] ?? '',
      differenceInDays: map['Difference_In_Days'] ?? '',
      reason: map['reason'] ?? '',
      statusId: map['status_id'] ?? '',
      companyId: map['company_id'] ?? '',
      comment: map['comment'] ?? '',
      userId: map['user_id'] ?? '',
      fullName: map['full_name'] ?? '',
      designationName: map['designation_name'] ?? '',
      leaveRequestStatusId: map['leave_request_status_id'] ?? '',
      leaveRequestStatusName: map['leave_request_status_name'] ?? '',
      leaveFromDateStatusId: map['leave_from_date_status_id'] ?? '',
      createdDate: map['created_date'] ?? '',
      fromDateStatusName: map['from_date_status_name'] ?? '',
      leaveToDateStatusId: map['leave_to_date_status_id'] ?? '',
      toDateStatusName: map['to_date_status_name'] ?? '',
    );
  }

  LeaveData copy(){
    return LeaveData(
      leaveRequestMasterId: leaveRequestMasterId,
      leaveRequestTypeId: leaveRequestTypeId,
      leaveRequestTypeName: leaveRequestTypeName,
      fromDate: fromDate,
      toDate: toDate,
      differenceInDays: differenceInDays,
      reason: reason,
      statusId: statusId,
      companyId: companyId,
      comment: comment,
      userId: userId,
      fullName: fullName,
      designationName: designationName,
      leaveRequestStatusId: leaveRequestStatusId,
      leaveRequestStatusName: leaveRequestStatusName,
      leaveFromDateStatusId: leaveFromDateStatusId,
      createdDate: createdDate,
      fromDateStatusName: fromDateStatusName,
      leaveToDateStatusId: leaveToDateStatusId,
      toDateStatusName: toDateStatusName);
  }
}