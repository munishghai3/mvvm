
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/app/modules/auth/modals/signup_response_modal.dart';



class RegisterControllerScreen extends GetxController {
  final formKey = GlobalKey<FormState>();


  RxBool isVisiblePassword = false.obs;
  RxBool isVisibleConfirmPassword = false.obs;

  TextEditingController firstNameContoller = TextEditingController();
  TextEditingController lastNameContoller = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode userNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
  FocusNode phoneNumberNode = FocusNode();

  bool isShowPassword = false;

  void togglePasswordView() {
    isShowPassword = !isShowPassword;
  }

  final dio = Dio();

  signUp() async {
    try{
      Map <String, dynamic> body = {
        "email" : emailController.text.trim(),
        "password" : passwordController.text.trim(),
        "username" : userController.text.trim(),
        "name":{
          "firstname": firstNameContoller.text.trim(),
          "lastname": lastNameContoller.text.trim(),
        },
        "phone": phoneNumberController.text.trim(),
      };
      var response = await dio.post('https://fakestoreapi.com/users', data: jsonEncode(body));
      SignupResponseModal signupResponseModal = SignupResponseModal.fromJson(response);
      if(response.statusCode == 200){
        print("register ${response.data.toString()}");
        return signupResponseModal;
      }
      else{
        return;
      }
    }
    catch(e){
      print(e);
    }

    // The below request is the same as above.
  }

}
