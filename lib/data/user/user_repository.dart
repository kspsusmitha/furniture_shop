import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/screens/checkoutpage.dart';

class UserRepository extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var id;
  RxInt total = 0.obs;
  List<Map<String, dynamic>> allDocument = [];
  var userid;
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user) async {
    print("hhhhhhhhhhhh");
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }

  Future<void> saveCartRecord(UserModel user) async {
    String cartedItems = "cartedItems";
    DocumentReference documentReference =
        _db.collection("users").doc(shared_preferences_id);
    CollectionReference collectionReference =
        documentReference.collection(cartedItems);
    try {
      await collectionReference.add(user.toMyCart());
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }

  Stream<List<Map<String, dynamic>>> getItemsStream() {
    try {
      Stream<QuerySnapshot> querySnapshotStream = FirebaseFirestore.instance
          .collection("users")
          .doc(shared_preferences_id)
          .collection("cartedItems")
          .snapshots();

      return querySnapshotStream.map((querySnapshot) {
        List<Map<String, dynamic>> allDocuments = [];

        querySnapshot.docs.forEach((doc) {
          Map<String, dynamic> documentData =
              doc.data() as Map<String, dynamic>;
          allDocuments.add(documentData);

          // totalprice = doc["price"] as int;
          // print(" total  $totalprice");
        });

        return allDocuments;
      });
    } catch (e) {
      print("Error fetching items: $e");
      return Stream.empty();
    }
  }

  Future<void> saveCheckOutRecord(UserModel user) async {
    String CheckOutDetails = "CheckOutDetails";
    DocumentReference documentReference =
        _db.collection("users").doc(shared_preferences_id);
    CollectionReference collectionReference =
        documentReference.collection(CheckOutDetails);
    try {
      await collectionReference.add(user.toMyCheckOut());
      Get.to(Checkoutscreen());
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }

  void calculateTotalPrice(List<Map<String, dynamic>> cartItems) {
    int calculatedTotal = 0;
    cartItems.forEach((doc) {
      calculatedTotal +=
          int.parse(doc['price'].toString().replaceAll("\u{20B9}", '')) ?? 0;
    });
    total.value = calculatedTotal;
    print("total   $total");
  }


 Stream<List<Map<String, dynamic>>> getCheckout(){
   try {
     Stream<QuerySnapshot> getitems=FirebaseFirestore.instance.collection("users").doc(shared_preferences_id).collection("CheckOutDetails").snapshots();
     return getitems.map((event) {
       List<Map<String, dynamic>> alldatas = [];
       event.docs.forEach((doc) {
        Map<String, dynamic> checkoutdata =
              doc.data() as Map<String, dynamic>;
              alldatas.add(checkoutdata);
       });
       return alldatas;
     });
   } catch (e) {
    print("error : $e");
     return Stream.empty();
   }
  }
}
