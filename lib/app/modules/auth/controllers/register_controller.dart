import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/app/database/databse_values.dart';
import 'package:structure_mvvm/main.dart';
import 'package:structure_mvvm/model/user/user_database_model.dart';
import 'package:structure_mvvm/network/auth_network.dart';
import 'package:structure_mvvm/routes/app_routes.dart';


class RegisterControllerScreen extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxBool isVisiblePassword = false.obs;
  RxBool isVisibleConfirmPassword = false.obs;

  TextEditingController firstNameContoller = TextEditingController();
  TextEditingController lastNameContoller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode phoneNumberNode = FocusNode();

  Rxn<File> imageFile = Rxn<File>();
  bool isShowPassword = false;
  var imageUrlUpload;

  void togglePasswordView() {
    isShowPassword = !isShowPassword;
  }

  final Uri toLaunch = Uri(scheme: 'https', host: 'www.Google.com');

/*============================ Local Database ============================*/
  localDbSignup() async {
    signUp(
      userDbModel: UserDbModel(
        firstName: firstNameContoller.text.trim(),
        lastName: lastNameContoller.text.trim(),
        email: emailController.text.trim(),
        phone: phoneNumberController.text.trim(),
        deviceType: Platform.isAndroid ? 'Android' : 'Ios',
        password: passwordController.text.trim(),
        imageUrl: imageUrlUpload,
      ),
      onSuccess: () {
        Get.offAllNamed(AppRoutes.mainScreen);
      },
    );
    // _createTable();
    // _insertTable();
  }

  /*Create Table*/
  _createTable() async {
    // ${DatabaseValues.columnPassword} TEXT NOT NULL, we cant save user's
    // Password so this should be removed

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

  /*Insert Data to Table*/
  _insertTable() async {
    //Fetching List
    List<Map<String, dynamic>>? itemMaps =
    await databaseHelper.getItems(DatabaseValues.tableUser);
    if (itemMaps != null) {
      List<UserDbModel> items =
      itemMaps.map((element) => UserDbModel.fromMap(element)).toList();
      int index = items.indexWhere(
              (element) => element.email == emailController.text.trim());
      if (index == -1) {
        int index1 = items.indexWhere(
                (element) =>
            element.phone == phoneNumberController.text.trim());
        if (index1 == -1) {
          await databaseHelper
              .insertItem(DatabaseValues.tableUser,
              model: UserDbModel(
                firstName: firstNameContoller.text.trim(),
                lastName: lastNameContoller.text.trim(),
                email: emailController.text.trim(),
                phone: phoneNumberController.text.trim(),
                deviceType: Platform.isAndroid ? 'Android' : 'Ios',
                password: passwordController.text.trim(),
                imageUrl: imageUrlUpload,
              ))
              .then((value) {}).onError((error, stackTrace) {});
        }
      }
    }
  }
}
