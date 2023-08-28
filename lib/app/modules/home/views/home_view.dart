import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/app/modules/home/controllers/home_controller.dart';
import 'package:structure_mvvm/app/modules/home/modals/home_modal.dart';
import 'package:structure_mvvm/utils/colors.dart';
import 'package:structure_mvvm/utils/size_constant.dart';
import 'package:structure_mvvm/utils/strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

HomeController controller = Get.put(HomeController());


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      appBar: AppBar(
        leading: SizedBox(),
        title: Text(
        TextFile.homeText,
      style:  TextStyle(
      color: ColorConstant.black900,
      fontSize: getFontSize(24),
        fontWeight: FontWeight.w400,
      ),
      ),backgroundColor: ColorConstant.gray50,
      centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (value) =>
        ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 30),
          itemCount: controller.textFieldsList.length,
          itemBuilder: (BuildContext context, int index) {
            return  TextFormField(
              controller: controller.textFieldsList[index].textController,
              textInputAction: TextInputAction.next,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  hintText: "Enter title",
                  label: Text("Title"),
                  suffixIcon: InkWell(
                      onTap: (index==0 || controller.increment == true) ? (){
                        controller.textFieldsList.add(
                            TextControllersModels(
                                textController: TextEditingController()));
                        controller.increment = false;
                        controller.update();
                      }: () {
                        controller.textFieldsList.removeAt(index);
                        controller.update();
                      },
                      child: Icon(
                          (index==0 || controller.increment == true) ?  Icons.add : Icons.minimize
                      ))
              ),
              onChanged: (input) {
                controller.title = input;
                controller.increment = true;
                controller.title == "" ? controller.increment = true : false;
                controller.update();
                setState(() {

                });
              }
            );
          },),
      ),
    );
  }
}
