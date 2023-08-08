class LeaveRequestModel {
  String fromDate;
  String leaveRequestStatusId;
  String leaveRequestTypeId;
  String searchGrid;
  String toDate;
  String userId;

  LeaveRequestModel({
    required this.fromDate,
    required this.leaveRequestStatusId,
    required this.leaveRequestTypeId,
    required this.searchGrid,
    required this.toDate,
    required this.userId,
  });

  factory LeaveRequestModel.createDefault(int searchGrid){
    return LeaveRequestModel(
      fromDate: "",
      leaveRequestStatusId: "0",
      leaveRequestTypeId: "0",
      searchGrid: "$searchGrid",
      toDate: "",
      userId: "0"
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "from_date": fromDate,
      "leave_request_status_id": leaveRequestStatusId,
      "leave_request_type_id": leaveRequestTypeId,
      "search_grid": searchGrid,
      "to_date": toDate,
      "user_id": userId
    };
  }
}