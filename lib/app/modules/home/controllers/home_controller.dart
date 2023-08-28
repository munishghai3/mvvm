import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/app/modules/home/modals/home_modal.dart';

class HomeController extends GetxController{
  List<TextControllersModels> textFieldsList = [ TextControllersModels(
      textController: TextEditingController())];

  String title = "";
  bool increment = false;
}