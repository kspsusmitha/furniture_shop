import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/screens/Sofa.dart';
import 'package:irohub_project/screens/addtocart.dart';
import 'package:irohub_project/screens/showallscreen.dart';

import 'package:irohub_project/widget/textandshowall.dart';

class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen> {
  var item = [];
  var bestsellers = [];
  getcategories() async {
    item.clear();

    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("categories")
        .get();

    item.addAll(res.data()?["exploreitems"]);
    bestsellers.addAll(res.data()?["bestsellers"]);
    print("length is   ${bestsellers.length}");

    setState(() {});
    return item;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getcategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 55),
              child: Text(
                "Explore",
                style: GoogleFonts.robotoSlab(
                    fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LimitedBox(
              maxHeight: 225,
              child: ListView.builder(
                  itemCount: item.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    print(index);
                    print(item[index]);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 146,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print("222222222${item[index]}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Sofascreen(
                                            exploreimage: item[index]
                                                ["product"])));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(3, 3),
                                        blurRadius: 5,
                                        color:
                                            Color.fromARGB(255, 119, 117, 117))
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    item[index]["image"],
                                    height: 158,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 8),
                                  child: Text(
                                    item[index]["name"],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    item[index]["item"],
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Showallscreen(
                                name: "Best sellers",
                                items: bestsellers,
                              )));
                },
                child: Showallbutton(text: "Best sellers")),
            Container(
              height: 580,
              width: double.infinity,
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: bestsellers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 4, crossAxisCount: 2, mainAxisExtent: 250),
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
                                            proName: bestsellers[index],
                                          )));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(6)),
                                width: 160,
                                height: 190,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.network(
                                      bestsellers[index]["image"],
                                      fit: BoxFit.fill,
                                    ))),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                bestsellers[index]["name"],
                                style: GoogleFonts.robotoSlab(),
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(
                                    text: "₹ ",
                                    style: TextStyle(color: Colors.grey[600])),
                                TextSpan(
                                  text: bestsellers[index]["price"].toString(),
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                )
                              ])))
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
