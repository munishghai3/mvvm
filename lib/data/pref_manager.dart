
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:structure_mvvm/main.dart';
import 'package:structure_mvvm/model/user/user_database_model.dart';

class PreferenceManger {
  static const String locale = "locale";
  static const String userModel = "userModel";
  static const String isFirstTime = "isFirstTime";
  static const String idLanguage = "idLanguage";


  firstLaunch(bool? isFirstCheck) {
    localStorage.write(isFirstTime, isFirstCheck)
        .onError((error, stackTrace) {
      debugPrint(error.toString());
      return false;
    });
    debugPrint( localStorage.read(isFirstTime).toString());
  }

  getStatusFirstLaunch() {
    return localStorage.read(isFirstTime) ?? false;
  }


  setLanguage(String? localeValue) {
    localStorage.write(locale,localeValue);
  }
  setLanguageId(int? languageId) {
    localStorage.write(idLanguage,languageId);
  }

  Locale? getLanguage() {
    final languageTag = localStorage.read(locale)as String?;
    if(languageTag!=null){
      return Locale(languageTag);
    }else{
      return null;
    }
  }
  getLanguageId() async {
    final languageId = localStorage.read(idLanguage)as int?;
    if(languageId!=null){
      return languageId;
    }else{
      return null;
    }
  }

  saveRegisterData(UserDbModel? model) async {
    localStorage.write(userModel, jsonEncode(model));
    debugPrint(model?.email);
  }

  Future getSavedLoginData() async {
    Map<String, dynamic>? userMap;
    final userStr = await localStorage.read(userModel);
    if (userStr != null) userMap = jsonDecode(userStr) as Map<String, dynamic>;
    if (userMap != null) {
      UserDbModel user = UserDbModel.fromMap(userMap);
      return user;
    }
    return null;
  }

  clearLoginData() {
    localStorage.remove(userModel);

  }





}

