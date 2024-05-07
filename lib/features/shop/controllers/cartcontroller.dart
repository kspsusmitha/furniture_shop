import 'package:get/get.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/widget/loaders/snakbar.dart';


class Cartcontroller extends GetxController {
  static Cartcontroller get instance => Get.find();

 Future<void> storeCartItems(String name,String image,int price) async {
    try {
      final newuser = UserModel(
          productname: name,
          image: image,
          price: price);

      final userRepository = Get.put(UserRepository());
      await userRepository.saveCartRecord(newuser);
      SnackBarLoader.successSnackbar(
          title: "Success", message: "Item added succesfully..!");
    } catch (e) {
      print("fuck....$e");
    }
  }

  
}


