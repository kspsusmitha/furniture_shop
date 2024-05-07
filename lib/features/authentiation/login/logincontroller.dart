import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/features/authentiation/signup/signupcontroller.dart';
import 'package:irohub_project/features/authentiation/usercontroller/usercontroller.dart';
import 'package:irohub_project/firebase/authenticationRep.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:irohub_project/utils/popups/fullscreenloader.dart';
import 'package:irohub_project/widget/loaders/snakbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  void clearTextEditingController() {
    passwordcontroller.clear();

    emailcontroller.clear();
  }

  final String text1 = "name";
  final userController = Get.put(Usercontroller());
  final controller = Get.put(SignupController());
  final hidePassword = true.obs;
  final localstorage = GetStorage();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  void signIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "assets/Animation - 1705692235217.json");
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Get.put(AuthenticationRepository());
      final userCredentials = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(
              emailcontroller.text.trim(), passwordcontroller.text.trim());
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("id", userCredentials.user!.uid);
      shared_preferences_id = userCredentials.user!.uid;
      preferences.setString("email", emailcontroller.text);
      // TFullScreenLoader.stopLoading();
      // AuthenticationRepository.instance.screenRedirect();

      // localstorage.write("userId", value.)

      Get.offAll(() => Homescreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      SnackBarLoader.errorSnackbar(
          title: "Oh Snap!", message: "Something went wrong");
    }
  }

  // google signIn
  void googleSignIn() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          "assets/Animation - 1705692235217.json");
      Get.put(AuthenticationRepository());

      // User Authenticaion
      final userCredentials =
          await AuthenticationRepository.instance.signInwithGoogle();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("id", userCredentials!.user!.uid);
      shared_preferences_id = userCredentials.user!.uid;

      // save user records
      await userController.saveUserRecordFromGoogle(userCredentials);
      // preferences.setString("email", userCredentials.user!.uid);
      // Remove loader
      TFullScreenLoader.openLoadingDialog(
          "assets/Animation - 1705692235217.json");
      TFullScreenLoader.stopLoading();
      // Navigation
      Get.offAll(() => Homescreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      SnackBarLoader.errorSnackbar(
          title: "Oh Snap!", message: "Something went wrong");
    }
  }
}
