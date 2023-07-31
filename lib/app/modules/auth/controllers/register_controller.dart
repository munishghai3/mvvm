
import 'package:flutter/material.dart';
import 'package:get/get.dart';



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

  bool isShowPassword = false;

  void togglePasswordView() {
    isShowPassword = !isShowPassword;
  }

/*============================ Local Database ============================*/
  localDbSignup() async {

  }

}
