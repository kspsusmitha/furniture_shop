import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:irohub_project/constants/appconstants.dart';

import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';

class Usercontroller extends GetxController {
  static Usercontroller get instance => Get.find();

//  late Rx<User>firebaseUser;
  Rx<UserModel> usermodel = UserModel().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onReady() {
    super.onReady();
    // firebaseUser=Rx<User>(auth.currentUser!);
    // firebaseUser!.bindStream(auth.userChanges());
  }

  Future<UserCredential?> saveUserRecordFromGoogle(
      UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final user = UserModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? "",
            email: userCredential.user!.email ?? "",
            phonenumber: userCredential.user!.phoneNumber ?? "not requird");
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      print("somthing went wrong $e");
    }
  }

  updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    FirebaseFirestore.instance.collection("users").doc().update(data);
  }
}
