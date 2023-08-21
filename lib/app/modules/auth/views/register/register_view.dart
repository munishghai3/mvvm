import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/app/modules/auth/controllers/register_controller.dart';
import 'package:structure_mvvm/app/widgets/buttons_widget.dart';
import 'package:structure_mvvm/app/widgets/validation_functions.dart';
import 'package:structure_mvvm/routes/app_routes.dart';
import 'package:structure_mvvm/utils/colors.dart';
import 'package:structure_mvvm/utils/size_constant.dart';
import 'package:structure_mvvm/utils/strings.dart';

import 'widgets/register_common_widget.dart';

class RegisterScreen extends GetView<RegisterControllerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstant.gray50,
        body: SingleChildScrollView(
            child: Form(
                key: controller.formKey,
                child: Container(
                    width: size.width,
                    padding: getPadding(
                        left: 15, top: 25, right: 15, bottom: 28),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          _signUpText(),
                          _fillTheDetailsText(),
                          _firstAndLastNameTextFields(),
                          _emailTextField(),
                          _userNameTextField(),
                          _phoneNumberTextField(),
                          _passwordTextField(),
                          _confirmPasswordTextField(),
                          _signUpButton(),
                          _orContinueWith(),
                          _alreadyHaveAnAccount(),
                        ]))),
          ),
        );
  }

  _signUpText() {
    return Padding(
        padding: getPadding(top: 25),
        child: Text(TextFile.signUpTitle.tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
    color: ColorConstant.black900,
    fontSize: getFontSize(
    24,
    ),
    fontWeight: FontWeight.w700,
    )),
    );
  }

  _fillTheDetailsText() {
    return Padding(
        padding: getPadding(top: 1, bottom: 10),
        child: Text(TextFile.fillTheDetails.tr,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: ColorConstant.black900,
              fontSize: getFontSize(
                24,
              ),
              fontWeight: FontWeight.w700,
            )));
  }


  _firstAndLastNameTextFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // First name
        Expanded(
          child: CommonTextFieldWidget(
            hintText: TextFile.firstName.tr,
            focusNode: controller.firstNameNode,
            onFieldSubmitted: (value) {
              controller.lastNameNode.requestFocus();
            },
            validator: (value) {
              return Validation().fieldChecker(value: value,field: TextFile.firstName.tr);
            },
            textInputAction: TextInputAction.next,
            inputController:
            controller.firstNameContoller,
            width: widthSizetextField / 2.1,
            keyBoardInputType: TextInputType.text,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        // Last Name
        Expanded(
          child: CommonTextFieldWidget(
            hintText: TextFile.lastName.tr,
            focusNode: controller.lastNameNode,
            onFieldSubmitted: (value) {
              controller.emailNode.requestFocus();
            },
            validator: (value) {
              return Validation().fieldChecker(value: value,field: TextFile.lastName.tr);
            },
            textInputAction: TextInputAction.next,
            inputController: controller.lastNameContoller,
            width: widthSizetextField / 2.1,
            keyBoardInputType: TextInputType.text,
          ),
        )
      ],
    ).marginOnly(top: 5);
  }

  _emailTextField() {
    return CommonTextFieldWidget(
      hintText: TextFile.emailText.tr,
      focusNode: controller.emailNode,
      onFieldSubmitted: (value) {
        controller.phoneNumberNode.requestFocus();
      },
      validator: (value) {
        return Validation().validateEmail(value);
      },
      textInputAction: TextInputAction.next,
      inputController: controller.emailController,
      width: widthSizetextField,
      keyBoardInputType: TextInputType.emailAddress,
    ).marginOnly(top: 8);
  }

  _userNameTextField() {
    return CommonTextFieldWidget(
      hintText: TextFile.userText.tr,
      focusNode: controller.userNode,
      onFieldSubmitted: (value) {
        controller.userNode.requestFocus();
      },
      validator: (value) {
        return Validation().fieldChecker(value: value,field: TextFile.userText.tr);
      },
      textInputAction: TextInputAction.next,
      inputController: controller.userController,
      width: widthSizetextField,
      keyBoardInputType: TextInputType.name,
    ).marginOnly(top: 8);
  }

  _phoneNumberTextField() {
    return CommonTextFieldWidget(
      hintText: TextFile.phoneNumber.tr,
      focusNode: controller.phoneNumberNode,
      onFieldSubmitted: (value) {
        controller.passwordNode.requestFocus();
      },validator: (value) {
      return Validation().validatePhoneNumber(value);
    },
      textInputAction: TextInputAction.next,
      inputController: controller.phoneNumberController,
      width: widthSizetextField,
      keyBoardInputType: TextInputType.phone,
    ).marginOnly(top: 8);
  }

  _passwordTextField() {
    return Obx(
          () => CommonTextFieldWidget(
        hintText: TextFile.password.tr,
        focusNode: controller.passwordNode,
        onFieldSubmitted: (value) {
          controller.confirmPasswordNode.requestFocus();
        },
        textInputAction: TextInputAction.next,
        inputController: controller.passwordController,
        validator: (value) {
          return Validation().validatePassword(value!);
        },
        width: widthSizetextField,
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

  _confirmPasswordTextField() {
    return Obx(
          () => CommonTextFieldWidget(
        hintText: TextFile.confirmPassword.tr,
        focusNode: controller.confirmPasswordNode,
        inputController:
        controller.confirmPasswordController,
        textInputAction: TextInputAction.done,
        width: widthSizetextField,
        validator: (value) {
          return Validation().validateConfirmPassword(value: value,password: controller.passwordController.text.trim());
        },
        suffix: InkWell(
          onTap: () {
            controller.isVisibleConfirmPassword.value =
            !controller
                .isVisibleConfirmPassword.value;
            debugPrint(controller
                .isVisibleConfirmPassword.value
                .toString());
          },
          child: Icon(
            controller.isVisibleConfirmPassword.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey.shade400,
            size: getSize(20),
          ).marginOnly(right: getSize(10)),
        ),
        obsecure:
        !controller.isVisibleConfirmPassword.value,
      ).marginOnly(top: 8),
    );
  }

  _signUpButton() {
    return CustomButton(
        height: 45,
        width: getSize(width),
        shape: ButtonShape.RoundedBorder22,
        text: TextFile.signUpTitle.tr,
        margin: getMargin(top: 27),
        variant: ButtonVariant.OutlineBlack9003f,
        fontStyle: ButtonFontStyle.InterSemiBold18,
        onTap: () {
          if(controller.formKey.currentState!.validate()){
            controller.signUp();
          }

        });
  }

  _orContinueWith() {
    return Padding(
        padding: getPadding(left: 6, top: 30, right: 4),
        child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                  height: getVerticalSize(1.00),
                  width: getHorizontalSize(120.00),
                  margin: getMargin(top: 8, bottom: 5),
                  decoration: BoxDecoration(
                      color: ColorConstant.gray400)),

              Container(
                  height: getVerticalSize(1.00),
                  width: getHorizontalSize(120.00),
                  margin: getMargin(top: 8, bottom: 5),
                  decoration: BoxDecoration(
                      color: ColorConstant.gray400))
            ]));
  }

  _alreadyHaveAnAccount() {
    return Padding(
        padding: getPadding(top: 17),
        child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: TextFile.alreadyHaveAccount.tr,
                  style:  TextStyle(
                    color: ColorConstant.gray50001,
                    fontSize: getFontSize(12),
                    fontWeight: FontWeight.w400,
                  ),),
              TextSpan(
                  text: TextFile.loginTitle.tr,
                  style:  TextStyle(
                    color: ColorConstant.gray50001,
                    fontSize: getFontSize(12),
                    fontWeight: FontWeight.w400,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.offAllNamed(
                          AppRoutes.loginScreen);
                    })
            ]),
            textAlign: TextAlign.left));
  }

}
