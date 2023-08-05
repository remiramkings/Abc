class CallData{
  String callLogId;
  String callDateTime;
  String callReceivedDateTime;
  String companyId;
  String userId;
  String callNumber;
  String callTypeId;
  String callStatusId;
  String callLogKey;
  String? realTimeStatus;
  String clientContactId;
  String clientId;
  String callDuration;
  String statusId;
  String callStatus;
  String recordingUrl;
  String? clientName;
  String fullName;
  String regionId;
  String branchId;

  CallData({
    required this.callLogId,
    required this.callDateTime,
    required this.callReceivedDateTime,
    required this.companyId,
    required this.userId,
    required this.callNumber,
    required this.callTypeId,
    required this.callStatusId,
    required this.callLogKey,
    this.realTimeStatus,
    required this.clientContactId,
    required this.clientId,
    required this.callDuration,
    required this.statusId,
    required this.callStatus,
    required this.recordingUrl,
    this.clientName,
    required this.fullName,
    required this.regionId,
    required this.branchId,
  });

  factory CallData.fromMap(Map<String, dynamic> map){
    return CallData(
      callLogId: map['call_log_id'] ?? "",
      callDateTime: map['call_date_time'] ?? "",
      callReceivedDateTime: map['call_recieved_date_time'] ?? "",
      companyId: map['company_id'] ?? "",
      userId: map['user_id'] ?? "",
      callNumber: map['call_number'] ?? "",
      callTypeId: map['call_type_id'] ?? "",
      callStatusId: map['call_status_id'] ?? "",
      callLogKey: map['call_log_key'] ?? "",
      realTimeStatus: map['real_time_status'] ?? "",
      clientContactId: map['client_contact_id'] ?? "",
      clientId: map['client_id'] ?? "",
      callDuration: map['call_duration'] ?? "",
      statusId: map['status_id'] ?? "",
      callStatus: map['call_status'] ?? "",
      recordingUrl: map['recording_url'] ?? "",
      clientName: map['client_name'] ?? "",
      fullName: map['full_name'] ?? "",
      regionId: map['region_id'] ?? "",
      branchId: map['branch_id'] ?? "",
    );
  }


}