
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/app/modules/auth/controllers/login_controller.dart';
import 'package:structure_mvvm/app/modules/auth/views/register/widgets/register_common_widget.dart';
import 'package:structure_mvvm/app/widgets/buttons_widget.dart';
import 'package:structure_mvvm/app/widgets/validation_functions.dart';
import 'package:structure_mvvm/routes/app_routes.dart';
import 'package:structure_mvvm/utils/colors.dart';
import 'package:structure_mvvm/utils/size_constant.dart';
import 'package:structure_mvvm/utils/strings.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.gray50,
      body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _loginText(),
              _form(),
              _loginButton(),
              _dontHaveAnAccount(),
            ],
          ).marginAll(15)),
    );
  }

  _loginText() {
    return Text(TextFile.loginTitle.tr,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: ColorConstant.black900,
          fontSize: getFontSize(
            24,
          ),
          fontWeight: FontWeight.w700,
        ))
        .marginOnly(top: 40);
  }

  _emailPhoneNumberTextField() {
    return CommonTextFieldWidget(
      hintText: TextFile.emailMobileText.tr,
      textInputAction: TextInputAction.next,
      inputController: controller.emailController,
      validator: (value) {
        return Validation().validateEmail(value);
      },
      focusNode: controller.emailNode,
      onFieldSubmitted: (val) {
        controller.passwordNode.requestFocus();
      },
      width: widthSizetextField,
      keyBoardInputType: TextInputType.emailAddress,
    );
  }

  _passwordTextField() {
    return Obx(
          () => CommonTextFieldWidget(
        hintText: TextFile.password.tr,
        inputController: controller.passwordController,
        focusNode: controller.passwordNode,
        textInputAction: TextInputAction.done,
        width: widthSizetextField,
        validator: (value) {
          return Validation().validatePassword(value!);
        },
        suffix: InkWell(
          onTap: () {
            controller.isVisiblePassword.value =
            !controller.isVisiblePassword.value;
          },
          child: Icon(
            controller.isVisiblePassword.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey.shade400,
            size: getSize(20),
          ).marginOnly(right: getSize(10)),
        ),
        obsecure: !controller.isVisiblePassword.value,
      ).marginOnly(top: 8),
    );
  }



  _loginButton() {
    return CustomButton(
        height: 45,
        width: getSize(width),
        shape: ButtonShape.RoundedBorder22,
        text: TextFile.loginTitle.tr,
        margin: getMargin(top: 20),
        variant: ButtonVariant.OutlineBlack9003f,
        fontStyle: ButtonFontStyle.InterSemiBold18,
        onTap: () {

          if(controller.formKey.currentState!.validate()){

              controller.localDbLogin();


          }

        });
  }




  _dontHaveAnAccount() {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: TextFile.dontHaveAccount.tr,
              style: TextStyle(
                color: ColorConstant.gray50001,
                fontSize: getFontSize(
                  14,
                ),
                fontWeight: FontWeight.w400,
              )),
          TextSpan(
              text: TextFile.signUpTitle.tr,
              style:  TextStyle(
                color: ColorConstant.greenA700,
                fontSize: getFontSize(
                  14,
                ),
                fontWeight: FontWeight.w400,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.offAllNamed(AppRoutes.signupScreen);
                })
        ]),
        textAlign: TextAlign.left)
        .marginOnly(top: 15);
  }


  _form() {
    return Form(
        key:controller.formKey,
        child: Column(children: [
          _emailPhoneNumberTextField(),
          _passwordTextField(),
        ],)).marginOnly(top: 80);
  }
}
