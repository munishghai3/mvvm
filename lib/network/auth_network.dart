

import 'package:get/get.dart';
import 'package:structure_mvvm/app/database/databse_values.dart';
import 'package:structure_mvvm/data/pref_manager.dart';
import 'package:structure_mvvm/main.dart';
import 'package:structure_mvvm/model/user/user_database_model.dart';

Future<void> userTableCreate() async {
  await databaseHelper.createtables(databaseHelper.db!,
      tableName: DatabaseValues.tableUser,
      executeCommamd: """CREATE TABLE ${DatabaseValues.tableUser} (
      ${DatabaseValues.columnId} INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      ${DatabaseValues.columnFirstName} TEXT NOT NULL,
      ${DatabaseValues.columnLastName} TEXT NOT NULL,
      ${DatabaseValues.columnEmail} TEXT NOT NULL,
      ${DatabaseValues.columnImageUrl} TEXT,
      ${DatabaseValues.columnLoginType} TEXT,
      ${DatabaseValues.columnPhone} TEXT,
      ${DatabaseValues.columnPassword} TEXT NOT NULL,
      ${DatabaseValues.columnDeviceType} TEXT,
      ${DatabaseValues.createdOn} TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
}

Future<void> login(
    {String? email, String? password, Function()? onSuccess}) async {

    await userTableCreate();
    List<Map<String, dynamic>>? itemMaps =
    await databaseHelper.getItems(DatabaseValues.tableUser);
    if (itemMaps != null) {
      List<UserDbModel> items =
      itemMaps.map((element) => UserDbModel.fromMap(element)).toList();
      int index = items.indexWhere((element) => email == element.email);
      if (index == -1) {
      } else {
        if (password == items[index].password) {
          PreferenceManger().saveRegisterData(items[index]);
          onSuccess!();
        } else {
        }
      }
    }
  }


Future<void> signUp({UserDbModel? userDbModel, Function()? onSuccess}) async {
  await userTableCreate();
  List<Map<String, dynamic>>? itemMaps =
  await databaseHelper.getItems(DatabaseValues.tableUser);
  if (itemMaps != null) {
    List<UserDbModel> items =
    itemMaps.map((element) => UserDbModel.fromMap(element)).toList();
    int index =
    items.indexWhere((element) => element.email == userDbModel?.email);
    if (index == -1) {
      int index1 =
      items.indexWhere((element) => element.phone == userDbModel?.phone);
      if (index1 == -1) {
        await databaseHelper
            .insertItem(DatabaseValues.tableUser, model: userDbModel)
            .then((value) {
          PreferenceManger().saveRegisterData(userDbModel);
          onSuccess!();
        }).onError((error, stackTrace) {});
      }
    }
  }

  Future<void> forgotPasswordMethod({String? emailPhoneValue,
    Function(UserDbModel userDbModel)? onSuccess}) async {
    await userTableCreate();
    List<Map<String, dynamic>>? itemMaps =
    await databaseHelper.getItems(DatabaseValues.tableUser);
    if (itemMaps != null) {
      List<UserDbModel> items =
      itemMaps.map((element) => UserDbModel.fromMap(element)).toList();
      int index = items.indexWhere((element) =>
      emailPhoneValue == element.email || emailPhoneValue == element.phone);
      if (index == -1) {
        if (GetUtils.isEmail(emailPhoneValue!)) {} else {}
      } else {
        onSuccess!(items[index]);
      }
    }
  }
}
