import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:structure_mvvm/app/widgets/common_image_widgets.dart';
import 'package:structure_mvvm/app/widgets/textfiled_widget.dart';

class CommonTextFieldWidget extends StatelessWidget {
  CommonTextFieldWidget(
      {super.key,
        this.hintText,
        this.inputController,
        this.onTap,
        this.readOnly = false,
        this.width,
        this.errorMsg,
        this.prefix,
        this.iconPath,
        this.validClick,
        this.validator,
        this.focusNode,
        this.fillColor,
        this.inputFormatters,
        this.keyBoardInputType,
        this.border,
        this.textInputAction,
        this.onFieldSubmitted,
        this.suffix,
        this.obsecure = false});

  String? hintText;
  TextEditingController? inputController;
  double? width;
  String? errorMsg;
  String? iconPath;
  Color? fillColor;
  InputBorder? border;
  TextInputAction? textInputAction;
  ValueChanged<String>? onFieldSubmitted;

  Function? validClick;
  final FormFieldValidator<String>? validator;
  FocusNode? focusNode;
  List<TextInputFormatter>? inputFormatters;

  Widget? suffix;
  Widget? prefix;
  bool readOnly;
  bool? obsecure;
  Function()? onTap;
  TextInputType? keyBoardInputType;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
        onTap: onTap ?? () {},
        width: width,border: border,
        readOnly: readOnly,
        fillColor: fillColor,
        height: 45,
        inputFormatters: inputFormatters ?? [],
        keyBoardInputType: keyBoardInputType,
        focusNode: focusNode,
        textInputAction: textInputAction,
        controller: inputController,
        hintText: hintText,
        margin: EdgeInsets.only(top: 10),
        onFieldSubmitted: onFieldSubmitted,
        isObscureText: obsecure!,
        suffix: suffix,
        prefix: prefix ??
            Container(
                margin: EdgeInsets.only(left: 16, top: 16, right: 10, bottom: 16),
                child: CustomImageView(svgPath: iconPath)),
        validator: validator);
  }
}