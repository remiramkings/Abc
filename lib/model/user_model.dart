import 'package:local_notification_project/model/common_id_name.dart';

class UserModel extends CommonIdName {
  UserModel({
    required super.id,
    required super.name
  });
  factory UserModel.fromMap(Map<String, dynamic> map){
    return UserModel(
       id: int.parse(map['user_id']), 
       name: map['full_name']
       );
  }
}