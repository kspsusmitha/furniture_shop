import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/features/shop/controllers/checkoutcontroller.dart';
import 'package:irohub_project/screens/checkoutpage.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:lottie/lottie.dart';

class cartscreen extends StatefulWidget {
  final allitems;
  final id;
  const cartscreen({super.key, this.allitems, this.id});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  final controller = Get.put(UserRepository());
  final controlller2 = UserRepository();

  List<Map<String, dynamic>> allDocument = [];
  int total = 0;
  int shippingFee = 40;
  int delivaryCharge = 50;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getCartItemIds();
  }

  List<String> itemIds = [];
  Future<List<String>> getCartItemIds() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(shared_preferences_id)
          .collection("cartedItems")
          .get();
      querySnapshot.docs.forEach((doc) {
        itemIds.add(doc.id);
        // Add the document ID to the list
      });
    } catch (e) {
      print("Error getting cart items: $e");
    }
    print("item id $itemIds");
    return itemIds;
  }

  Future<void> deleteCartItem(String cartItemId) async {
    try {
      DocumentReference documentReference = FirebaseFirestore.instance
          .collection("users")
          .doc(shared_preferences_id)
          .collection("cartedItems")
          .doc(cartItemId);
      await documentReference.delete();
    } catch (e) {
      throw "Something went wrong $e";
    }
  }

  void onDeleteButtonTap(String cartItemId) {
    deleteCartItem(cartItemId.toString());
  }

  List cartitems = ["1"];
  final UserModel user = UserModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar:
      // InkWell(
      //   onTap: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) =>
      //                 cartitems.isEmpty ? Homescreen() : Checkoutscreen()));
      //   },
      //   child: Container(
      //     color: Colors.black,
      //     height: 70,
      //     width: double.infinity,
      //     child: Center(
      //       child: cartitems.isEmpty
      //           ? Text(
      //               "GO SHOPPING",
      //               style: GoogleFonts.robotoSlab(color: Colors.white),
      //             )
      //           : Text(
      //               "CHECKOUT",
      //               style: GoogleFonts.robotoSlab(color: Colors.white),
      //             ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: GoogleFonts.robotoSlab(color: Colors.black),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Shopping cart",
                  style: GoogleFonts.robotoSlab(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Divider(
              thickness: 0.5,
            ),
            StreamBuilder(
                stream: controller.getItemsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      heightFactor: 16,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    List<Map<String, dynamic>> items = snapshot.data!;
                    controller.calculateTotalPrice(items);

                    if (items.isEmpty) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              child: Lottie.asset(
                                "assets/Animation - 1705691997361.json",
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                width: MediaQuery.of(context).size.width * 1.3,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Your Shopping cart is empty !",
                              style: GoogleFonts.robotoSlab(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              """Fortnately, there's an easy solution GO...""",
                              style: GoogleFonts.robotoSlab(
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return Column(
                        children: [
                          LimitedBox(
                            maxHeight: 460,
                            child: ListView.separated(
                                separatorBuilder: (context, index) => Padding(
                                      padding: const EdgeInsets.only(left: 60),
                                      child: Divider(
                                        thickness: 0.4,
                                      ),
                                    ),
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: UniqueKey(),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) {
                                      setState(() {
                                        onDeleteButtonTap("${itemIds[index]}");
                                      });
                                    },
                                    background: Container(
                                      width: 90,
                                      height: 110,
                                      color: Colors.red,
                                    ),
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 19, bottom: 25, top: 5),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.grey[200],
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            width: 90,
                                            height: 110,
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Image.network(
                                                    items[index]["image"],
                                                    fit: BoxFit.fill,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Flexible(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, bottom: 10),
                                                child: Text(
                                                  items[index]["productname"],
                                                  // controller.allDocument[index]["name"],
                                                  style: GoogleFonts.robotoSlab(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ),
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8, top: 3),
                                                  child: RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "₹ ",
                                                        style: TextStyle(
                                                            color: Colors
                                                                .grey[600])),
                                                    TextSpan(
                                                      text: items[index]
                                                              ["price"]
                                                          .toString(),
                                                      style: GoogleFonts
                                                          .robotoSlab(
                                                              color: Colors
                                                                  .grey[400]),
                                                    )
                                                  ]))),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8, top: 8),
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      height: 10,
                                                      width: 10,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(20),
                                                          color: Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "Black",
                                                      style: GoogleFonts
                                                          .robotoSlab(
                                                              color: Colors
                                                                  .grey[400]),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      "|",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.grey[400]),
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Text(
                                                      "Size :",
                                                      style: GoogleFonts
                                                          .robotoSlab(
                                                              color:
                                                                  Colors.grey),
                                                    ),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text(
                                                      "38",
                                                      style: GoogleFonts
                                                          .robotoSlab(
                                                              color:
                                                                  Colors.black),
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            // allDocument
                                                            //     .removeAt(index);
                                                            onDeleteButtonTap(
                                                                "${itemIds[index]}");
                                                          });
                                                        },
                                                        icon: const Icon(
                                                          Icons.delete_rounded,
                                                          color: Colors.black,
                                                        ))
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 12, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping fee",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                ),
                                Text(
                                  "₹ ${shippingFee.toString()}",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 12, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Delivary fee",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                ),
                                Text(
                                  "₹ ${delivaryCharge.toString()}",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 12, bottom: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Total",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "₹ ${controller.total + delivaryCharge + shippingFee}",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            onTap: () {
                              controller.saveCheckOutRecord(
                                  UserModel(checkoutitem: "${items}"));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Checkoutscreen()));
                            },
                            child: Container(
                              color: Colors.black,
                              height: 70,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  "CHECKOUT",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  } else {
                    return Center(
                      child: Text('No data available'),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
