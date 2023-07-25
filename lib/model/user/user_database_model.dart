
import 'package:structure_mvvm/app/database/databse_values.dart';

class UserDbModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? loginType;
  String? phone;
  String? deviceType;
  String? password;
  String? createdOn;

  UserDbModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.imageUrl,
    this.loginType,
    this.phone,
    this.deviceType,
    this.password,
    this.createdOn,
  });

  UserDbModel.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseValues.columnId];
    firstName = map[DatabaseValues.columnFirstName];
    lastName = map[DatabaseValues.columnLastName];
    email = map[DatabaseValues.columnEmail];
    imageUrl = map[DatabaseValues.columnImageUrl];
    loginType = map[DatabaseValues.columnLoginType];
    phone = map[DatabaseValues.columnPhone];
    deviceType = map[DatabaseValues.columnDeviceType];
    password = map[DatabaseValues.columnPassword];
    createdOn = map[DatabaseValues.createdOn];
  }
  UserDbModel.fromJson(Map<String, dynamic> map) {
    id = map[DatabaseValues.columnId];
    firstName = map[DatabaseValues.columnFirstName];
    lastName = map[DatabaseValues.columnLastName];
    email = map[DatabaseValues.columnEmail];
    imageUrl = map[DatabaseValues.columnImageUrl];
    loginType = map[DatabaseValues.columnLoginType];
    phone = map[DatabaseValues.columnPhone];
    deviceType = map[DatabaseValues.columnDeviceType];
    password = map[DatabaseValues.columnPassword];
    createdOn = map[DatabaseValues.createdOn];
  }

  Map<String, Object?> toMap() {
    var map = <String, Object?>{
      DatabaseValues.columnId: id,
      DatabaseValues.columnFirstName: firstName,
      DatabaseValues.columnLastName: lastName,
      DatabaseValues.columnEmail: email,
      DatabaseValues.columnImageUrl: imageUrl,
      DatabaseValues.columnLoginType: loginType,
      DatabaseValues.columnPhone: phone,
      DatabaseValues.columnDeviceType: deviceType,
      DatabaseValues.createdOn: createdOn,
      DatabaseValues.columnPassword: password,
    };
    return map;
  }


  Map<String, Object?> toJson() {
    var map = <String, Object?>{
      DatabaseValues.columnId: id,
      DatabaseValues.columnFirstName: firstName,
      DatabaseValues.columnLastName: lastName,
      DatabaseValues.columnEmail: email,
      DatabaseValues.columnImageUrl: imageUrl,
      DatabaseValues.columnLoginType: loginType,
      DatabaseValues.columnPhone: phone,
      DatabaseValues.columnDeviceType: deviceType,
      DatabaseValues.createdOn: createdOn,
      DatabaseValues.columnPassword: password,
    };
    return map;
  }
}
