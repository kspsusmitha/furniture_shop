import 'package:get/get.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';

class CheckOutController extends GetxController{

  static CheckOutController get instance=> Get.find();

  Future <void> saveCheckOutRecords( name,String image,int price)async{
    try {
      final newuser = UserModel(
          productname: name,
          image: image,
          price: price);

      final userRepository = Get.put(UserRepository());
      await userRepository.saveCheckOutRecord(newuser);
      // SnackBarLoader.successSnackbar(
      //     title: "Success", message: "Item added succesfully..!");
    } catch (e) {
      print("error :$e");
    }
  }
}