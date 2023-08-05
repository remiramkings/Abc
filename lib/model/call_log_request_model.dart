class CallLogRequest {
  String companyId;
  String mode;
  String branchId;
  String regionId;
  num year;
  num month;
  String clientName;
  String deliveryDate;
  String updatedDate;
  List<String> assignedUser;
  String tDate;

  CallLogRequest(
      {required this.companyId,
      required this.mode,
      required this.branchId,
      required this.regionId,
      required this.year,
      required this.month,
      required this.clientName,
      required this.deliveryDate,
      required this.updatedDate,
      required this.assignedUser,
      required this.tDate});

  Map<String, dynamic> toRequest() {
    return ({
      "company_id": companyId,
      "mode": mode,
      "branch_id": branchId,
      "region_id": regionId,
      "year": year,
      "month": month,
      "client_name": clientName,
      "delivery_date": deliveryDate,
      "updated_date": updatedDate,
      "assigned_user": assignedUser,
      "T_date": tDate
    });
  }
}
