import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';


class LoginController extends GetxController {
  // final formKey = GlobalKey<FormState>();

  RxBool isVisiblePassword = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();




}
