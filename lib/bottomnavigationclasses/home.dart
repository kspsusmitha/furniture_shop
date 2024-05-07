import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/extensions/screensize.dart';
import 'package:irohub_project/features/shop/controllers/cartcontroller.dart';
import 'package:irohub_project/screens/addtocart.dart';
import 'package:irohub_project/screens/showallscreen.dart';
import '../imageclass/classA.dart';
import '../imageclass/classB.dart';
import '../imageclass/classC.dart';
import '../widget/textandshowall.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {});
  }

  final controller = Cartcontroller();
  List slideimage = [ClassA(), ClassB(), CLassC()];
  var newarriavls = [];
  var topdeals = [];
  var toptrends = [];
  Future getitems() async {
    var res = await FirebaseFirestore.instance
        .collection("homescreenitems")
        .doc("allitems")
        .get();

    newarriavls.addAll(res.data()?["newarrivals"]);
    topdeals.addAll(res.data()?["topdeals"]);
    toptrends.addAll(res.data()?["toptrends"]);
  }
 @override
  Widget build(BuildContext context) {
    var size, height, width;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 8, blurStyle: BlurStyle.outer)
            ]),
            height: height / 2.1,
            width: double.infinity,
            child: Stack(
              children: [
                CarouselSlider.builder(
                    unlimitedMode: true,
                    enableAutoSlider: true,
                    autoSliderTransitionTime: Duration(seconds: 1),
                    slideTransform: DefaultTransform(),
                    slideBuilder: (index) {
                      return Stack(
                        children: [
                          slideimage[index],
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, left: 19),
                              child: Row(
                                children: List.generate(3, (indexeDots) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: index == indexeDots ? 20 : 9,
                                      height: 9,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.black),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: slideimage.length),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Showallscreen(
                              name: "New Arrivals",
                              items: newarriavls,
                            )));
              },
              child: Showallbutton(text: "New Arrivals")),
          FutureBuilder(
              future: getitems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LimitedBox(
                    maxHeight: context.Height(0.29),
                    child: ListView.builder(
                        itemCount: 3,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Addtocart1(
                                                proName: newarriavls[index])));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    width: 170,
                                    height: 170,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          newarriavls[index]["image"],
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      newarriavls[index]["name"],
                                      style: GoogleFonts.robotoSlab(),
                                    )),
                                RichText(
                                    text: TextSpan(children: [
                                  TextSpan(
                                      text: "₹ ",
                                      style:
                                          TextStyle(color: Colors.grey[600])),
                                  TextSpan(
                                    text:
                                        newarriavls[index]["price"].toString(),
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  )
                                ]))
                              ],
                            ),
                          );
                        }),
                  );
                }
                return Container(width: 170, height: 170);
              }),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Showallscreen(
                              name: "Top Trends",
                              items: toptrends,
                            )));
              },
              child: Showallbutton(text: "Top Trends")),
          FutureBuilder(
              future: getitems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LimitedBox(
                    maxHeight: 230,
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Addtocart1(
                                                  proName: toptrends[index],
                                                )));
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      width: 170,
                                      height: 170,
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                            toptrends[index]["image"],
                                            fit: BoxFit.fill,
                                          ))),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      toptrends[index]["name"],
                                      style: GoogleFonts.robotoSlab(),
                                    )),
                                Align(
                                    alignment: Alignment.topLeft,
                                    child: RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "₹ ",
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      TextSpan(
                                        text: toptrends[index]["price"]
                                            .toString(),
                                        style: GoogleFonts.robotoSlab(
                                            color: Colors.grey[400]),
                                      )
                                    ])))
                              ],
                            ),
                          );
                        }),
                  );
                }
                return Container(width: 170, height: 170);
              }),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Showallscreen(
                              name: "Top Deals",
                              items: topdeals,
                            )));
              },
              child: Showallbutton(text: "Top Deals")),
          FutureBuilder(
              future: getitems(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LimitedBox(
                    maxHeight: 700,
                    child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            Divider(thickness: 0.5, indent: width / 3.1),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Addtocart1(
                                            proName: topdeals[index],
                                          )));
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, bottom: 8, left: 8, right: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    width: 90,
                                    height: 90,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          topdeals[index]["image"],
                                          fit: BoxFit.fill,
                                        )),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, right: 10, top: 8),
                                          child: Text(
                                            topdeals[index]["name"],
                                            style: GoogleFonts.robotoSlab(),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 8),
                                                child: RichText(
                                                    text: TextSpan(children: [
                                                  TextSpan(
                                                      text: "₹ ",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey[600])),
                                                  TextSpan(
                                                    text: topdeals[index]
                                                            ["price"]
                                                        .toString(),
                                                    style:
                                                        GoogleFonts.robotoSlab(
                                                            color: Colors
                                                                .grey[400]),
                                                  )
                                                ]))),
                                            IconButton(
                                                color: Colors.black,
                                                onPressed: () {
                                                  controller.storeCartItems(
                                                      topdeals[index]["name"],
                                                      topdeals[index]["image"],
                                                      topdeals[index]["price"]);
                                                },
                                                icon: Icon(
                                                  Icons.shopping_bag,
                                                  color: Color.fromARGB(
                                                      255, 241, 71, 59),
                                                  size: 18,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                }
                return Container(height: 700);
              })
        ],
      ),
    );
  }
}
