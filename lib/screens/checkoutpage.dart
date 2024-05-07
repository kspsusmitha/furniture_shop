import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/screens/thankupage.dart';

class Checkoutscreen extends StatefulWidget {
  const Checkoutscreen({super.key});

  @override
  State<Checkoutscreen> createState() => _CheckoutscreenState();
}

class _CheckoutscreenState extends State<Checkoutscreen> {
  final controller = Get.put(UserRepository());
  String _selectedvalue = "1";
  String _selectedvalue1 = "1";

  List paymentname = ["VISA", "Paypal", "Master Card"];
  List paymentid = [
    "**** **** **** 3765",
    "robert@gmail.net",
    "**** **** **** 3765"
  ];
  List paymentimages = [
    "assets/icons8-visa-48.png",
    "assets/icons8-rupay-48.png",
    "assets/icons8-mastercard-48.png"
  ];
  List<Icon> icons = [Icon(Icons.home_rounded), Icon(Icons.apartment)];

  storeCheckOutItems() {
    try {
      final user = UserModel(
          peymentMethods: paymentname.toString(),
          shippingDetails: "658 Yost Island Apt");
      final userRepository = Get.put(UserRepository());
      userRepository.saveCheckOutRecord(user);
      Get.to(Thankyou());
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          // storeCheckOutItems();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Thankyou()));
        },
        child: Container(
          color: Colors.black,
          height: 65,
          width: double.infinity,
          child: Center(
            child: Text(
              "PAYMENT",
              style: GoogleFonts.robotoSlab(color: Colors.white),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Checkout",
                style: GoogleFonts.robotoSlab(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Divider(
              thickness: 0.5,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Shipping to",
                style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            LimitedBox(
              maxHeight: 75,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 6, top: 6, bottom: 6),
                    child: Container(
                      height: 50,
                      width: 265,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.25,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                                color: Colors.grey.withOpacity(0.5))
                          ],
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(9)),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            top: 12,
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: icons[0]),
                          ),
                          Positioned(
                            top: 13,
                            left: 60,
                            child: Text(
                              "658 Yost Island Apt",
                              style: GoogleFonts.robotoSlab(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 60,
                            child: Text(
                              "Seattle , US",
                              style: GoogleFonts.robotoSlab(color: Colors.grey),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 6,
                            child: Radio(
                              value: "1",
                              groupValue: _selectedvalue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedvalue = value!;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12, right: 6, top: 6, bottom: 6),
                    child: Container(
                      height: 50,
                      width: 265,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 0.25,
                                blurRadius: 2,
                                offset: Offset(0, 3),
                                color: Colors.grey.withOpacity(0.5))
                          ],
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(9)),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 10,
                            top: 12,
                            child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: icons[1]),
                          ),
                          Positioned(
                            top: 13,
                            left: 60,
                            child: Text(
                              "658 Yost Island Apt",
                              style: GoogleFonts.robotoSlab(
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: 60,
                            child: Text(
                              "Seattle , US",
                              style: GoogleFonts.robotoSlab(color: Colors.grey),
                            ),
                          ),
                          Positioned(
                            right: 5,
                            top: 6,
                            child: Radio(
                              value: "2",
                              groupValue: _selectedvalue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedvalue = value!;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 14, bottom: 8),
              child: Text(
                'Payment method',
                style: GoogleFonts.robotoSlab(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 8, left: 11, right: 11, bottom: 14),
              child: Container(
                  height: 310,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                          color: const Color.fromARGB(255, 219, 217, 217))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(paymentimages[0]),
                          ),
                          title: Text(
                            paymentid[0],
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700]),
                          ),
                          subtitle: Text(
                            paymentname[0],
                            style: GoogleFonts.robotoSlab(color: Colors.grey),
                          ),
                          trailing: Radio(
                            value: "3",
                            groupValue: _selectedvalue1,
                            onChanged: (value) {
                              setState(() {
                                _selectedvalue1 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(paymentimages[1]),
                          ),
                          title: Text(
                            paymentid[1],
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700]),
                          ),
                          subtitle: Text(
                            paymentname[1],
                            style: GoogleFonts.robotoSlab(color: Colors.grey),
                          ),
                          trailing: Radio(
                            value: "4",
                            groupValue: _selectedvalue1,
                            onChanged: (value) {
                              setState(() {
                                _selectedvalue1 = value!;
                              });
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage(paymentimages[2]),
                          ),
                          title: Text(
                            paymentid[2],
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[700]),
                          ),
                          subtitle: Text(
                            paymentname[2],
                            style: GoogleFonts.robotoSlab(color: Colors.grey),
                          ),
                          trailing: Radio(
                            value: "5",
                            groupValue: _selectedvalue1,
                            onChanged: (value) {
                              setState(() {
                                _selectedvalue1 = value!;
                              });
                            },
                          ),
                        ),
                      )
                    ],
                  )),
            ),
            Divider(
              thickness: 0.5,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: GoogleFonts.robotoSlab(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "₹ ${controller.total}",
                    style: GoogleFonts.robotoSlab(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
