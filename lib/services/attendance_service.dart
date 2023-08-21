import 'package:http/http.dart';
import 'package:local_notification_project/model/attendance_model.dart';
import 'package:local_notification_project/services/base_service.dart';

class AttendanceService extends BaseService{
  static final AttendanceService _instance = AttendanceService();

  static AttendanceService getInstance(){
    return _instance;
  }

  Future<AttendanceModel?> getAttendanceDetails() async{
    Uri uri = getApiUri('crm.todomor.com', 'api/ShowDailyReport/6/2023-08/0/1745/1/21');
    var headers = {'Content-Type': 'application/json'};

    Response response = await client.get(uri, headers: headers);
    if(!isSuccess(response)){
      return null;
    }

    Map<String, dynamic> responseMap = getMap(response);

   if(!responseMap.containsKey('date')||!responseMap.containsKey('result')){
      return null;
   }
    return AttendanceModel.fromMap(responseMap);
  }
}