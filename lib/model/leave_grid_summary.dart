class LeaveSummary {
  String allCount;
  String Waitlist;
  String Approved;
  String Rejected;
  String LongL;
  String SickL;
  String CasualL;
  String SpecialL;
  String LopL;

  LeaveSummary({
    required this.allCount,
    required this.Waitlist,
    required this.Approved,
    required this.Rejected,
    required this.LongL,
    required this.SickL,
    required this.CasualL,
    required this.SpecialL,
    required this.LopL
  });

  factory LeaveSummary.fromMap(Map<String, dynamic> map){
    return LeaveSummary(
      allCount: map['All_count'] ?? '',
      Waitlist: map['Waitlist'] ?? '',
      Approved: map['Approved'] ?? '',
      Rejected: map['Rejected'] ?? '',
      LongL: map['LongL'] ?? '',
      SickL: map['SickL'] ?? '',
      CasualL: map['CasualL'] ?? '',
      SpecialL: map['SpecialL'] ?? '',
      LopL: map['LopL'] ?? '',
    );
  }
}