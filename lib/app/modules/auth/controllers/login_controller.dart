


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/network/auth_network.dart';
import 'package:structure_mvvm/routes/app_routes.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  bool checkBox = false;
  RxBool isVisiblePassword = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();


/*============================ Local DB Login ============================*/
  localDbLogin() async {
    login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        onSuccess: () {
          Get.offAllNamed(AppRoutes.mainScreen);
        });
  }

}
