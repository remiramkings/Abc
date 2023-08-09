class LeaveRequestStatus{
  int leaveRequestStatusId;
  String leaveRequestStatusName;
  int statusId;
  int companyId;

  LeaveRequestStatus({
    required this.leaveRequestStatusId,
    required this.leaveRequestStatusName,
    required this.statusId,
    required this.companyId
  });

  factory LeaveRequestStatus.fromMap(Map<String, dynamic> map){
    return LeaveRequestStatus(
      leaveRequestStatusId: map['leave_request_status_id'] ?? 0,
      leaveRequestStatusName: map['leave_request_status_name'] ?? '',
      statusId: map['status_id'] ?? 0,
      companyId: map['company_id'] ?? 0,
    );
  }


}