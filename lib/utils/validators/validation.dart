import 'package:irohub_project/utils/popups/fullscreenloader.dart';
import 'package:irohub_project/widget/loaders/snakbar.dart';

class TValidator {
  static String? validateEmptyText(String? feildname, String? value) {
    if (value == null || value.isEmpty) {
      return "$feildname  is required";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      //  TFullScreenLoader.stopLoading();
      // SnackBarLoader.errorSnackbar(
      //     title: "Email is required!",
      //     message: "enter your em",
      //     duration: Duration(seconds: 1));
      return "Email is required";
    }
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value)) {
      return "Invalid email address";
    }

    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      //  TFullScreenLoader.stopLoading();
      // SnackBarLoader.errorSnackbar(
      //     title: "Password is required!",
      //     message: "enter your 6 digit pass key",
      //     duration: Duration(seconds: 1));
      return "Password is required";
    }
    if (value.length < 6) {
      return "Password must be at least 6 cherecters long";
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return "phone number is required";
    }
    if (value.length < 10) {
      return "Phone number must be  10 numbers long";
    }
    if (value.length > 10) {
      return "Enter a valid phone number";
    }

    return null;
  }
}
