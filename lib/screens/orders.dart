import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:lottie/lottie.dart';

class Orderscreen extends StatefulWidget {
  const Orderscreen({super.key});

  @override
  State<Orderscreen> createState() => _OrderscreenState();
}

class _OrderscreenState extends State<Orderscreen> {
  final controller = Get.put(UserRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: StreamBuilder(
          stream: controller.getCheckout(),
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
              print("dataaa $items");
              controller.calculateTotalPrice(items);

              if (items.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        child: Lottie.asset(
                          "assets/Animation - 1705691997361.json",
                          height: MediaQuery.of(context).size.height * 0.4,
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
                        "Your Shopping orders is empty !",
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
                        style:
                            GoogleFonts.robotoSlab(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                );
              } else {
                return Column(children: [
                  Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        "ORDERS",
                        style: GoogleFonts.robotoSlab(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.w500),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Divider(
                    thickness: 2,
                  ),
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
                            return Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 19, bottom: 25, top: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    width: 90,
                                    height: 110,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          // child: Image.network(
                                          //   items[index]["image"],
                                          //   fit: BoxFit.fill,
                                          //   width: double.infinity,
                                          //   height: double.infinity,
                                          // ),
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
                                        child: Text(""
                                            // items[index]["productname"],
                                            // // controller.allDocument[index]["name"],
                                            // style: GoogleFonts.robotoSlab(
                                            //     fontWeight: FontWeight.w500),
                                            ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, top: 3),
                                          child: RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text: "₹ ",
                                                style: TextStyle(
                                                    color: Colors.grey[600])),
                                            TextSpan(
                                                // text: items[index]["price"]
                                                //     .toString(),
                                                // style: GoogleFonts.robotoSlab(
                                                //     color: Colors.grey[400]),
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
                                                      BorderRadius.circular(20),
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "Black",
                                              style: GoogleFonts.robotoSlab(
                                                  color: Colors.grey[400]),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "|",
                                              style: TextStyle(
                                                  color: Colors.grey[400]),
                                            ),
                                            const SizedBox(
                                              width: 8,
                                            ),
                                            Text(
                                              "Size :",
                                              style: GoogleFonts.robotoSlab(
                                                  color: Colors.grey),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "38",
                                              style: GoogleFonts.robotoSlab(
                                                  color: Colors.black),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }))
                ]);
              }
            }
            return Container();
          }),
    ));
  }
}
