import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/firebase/authenticationRep.dart';

import 'package:irohub_project/screens/loginscreen.dart';
import 'package:irohub_project/utils/popups/fullscreenloader.dart';
import 'package:irohub_project/widget/loaders/snakbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final hidePassword = true.obs;
  static SignupController get instance => Get.find();
  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonenumbercontroller = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // void clearTextEditingController(){
  //   passwordcontroller.clear();
  //   namecontroller.clear();
  //   emailcontroller.clear();
  //   phonenumbercontroller.clear();
  // }

  void Signup() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "assets/Animation - 1705692235217.json");
      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Get.put(AuthenticationRepository());
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              emailcontroller.text.trim(), passwordcontroller.text.trim());
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString("id", userCredential.user!.uid);
      shared_preferences_id = userCredential.user!.uid;
      final newuser = UserModel(
        id: userCredential.user!.uid,
        name: namecontroller.text.trim(),
        email: emailcontroller.text.trim(),
        phonenumber: phonenumbercontroller.text.trim(),
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newuser);
      TFullScreenLoader.openLoadingDialog(
          "assets/Animation - 1705692235217.json");
      SnackBarLoader.successSnackbar(
          title: "Congratulaton", message: "Your account has been created");

      // clearTextEditingController();
      Get.off(() => Loginscreen());
    } catch (e) {
      SnackBarLoader.errorSnackbar(
          title: "Oh Snap!", message: "Somthing went wrong");
      TFullScreenLoader.stopLoading();
      print(e);
    } finally {
      // TFullScreenLoader.stopLoading();
    }
  }
}
