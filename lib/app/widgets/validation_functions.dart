
import 'package:get/get.dart';
import 'package:structure_mvvm/utils/strings.dart';

class Validation {

  String? fieldChecker({String? value, String? field}) {
    if (value!.isEmpty) {
      return '${TextFile.pleaseEnter.tr}$field';
    }
  }
  String? validatePhoneNumber(String? value) {
    if (value!.isEmpty) {
      return TextFile.mobileNumberError.tr;
    }else if(!GetUtils.isPhoneNumber(value)){
      return TextFile.mobileNumberValid.tr;
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return TextFile.passwordError.tr;
    }
    if (!(value.length > 7) && value.isNotEmpty) {
      return TextFile.passwordLengthError.tr;
    }
    return null;
  }
  String? validateConfirmPassword({String? value,String? password}) {
    if (value!.isEmpty) {
      return TextFile.confirmPasswordError.tr;
    }else if(value!=password){
      return TextFile.confirmPasswordDoesntMatch.tr;
    }

    return null;
  }
  String? validateEmail(String? value) {
    if(value!.isEmpty){
      return TextFile.emailError.tr;
    }else if(!GetUtils.isEmail(value)){
      return TextFile.validEmail.tr;
    }
    return null;


  }

  bool isValidPassword(String? inputString, {bool isRequired = false}) {
    bool isInputStringValid = false;

    if ((inputString == null ? true : inputString.isEmpty) && !isRequired) {
      isInputStringValid = true;
    }

    if (inputString != null) {
      const pattern =
          r'^(?=.*?[A-Z])(?=(.*[a-z]){1,})(?=(.*[\d]){1,})(?=(.*[\W]){1,})(?!.*\s).{8,}$';

      final regExp = RegExp(pattern);

      isInputStringValid = regExp.hasMatch(inputString);
    }

    return isInputStringValid;
  }

/// Checks if string consist only Alphabet. (No Whitespace)

}
