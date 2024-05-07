import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/features/shop/controllers/cartcontroller.dart';
import 'package:irohub_project/screens/addtocart.dart';
import 'package:irohub_project/screens/showallscreen.dart';
import 'package:irohub_project/widget/textandshowall.dart';

class thirdcollection extends StatefulWidget {
  final collection1;
  final collection2;

  thirdcollection({super.key, this.collection1, required this.collection2});

  @override
  State<thirdcollection> createState() => _CybermondayState();
}

class _CybermondayState extends State<thirdcollection> {
  var size, height, width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdatafromfirestore();
    print("pppppppppppppppp ${widget.collection2}");
  }

  var thirdcollection = [];
  getdatafromfirestore() async {
    var res = await FirebaseFirestore.instance
        .collection("collections")
        .doc("thirdcollections")
        .get();
    thirdcollection.add(res.data());
    print("hhhhhhhhhhhhhh ${res.data()}");
    print("mmmmmmmmmmmm ${thirdcollection}");
  }

  final controller = Cartcontroller();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 550,
              color: Colors.grey[200],
              width: double.infinity,
              child: Stack(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                ),
                Positioned(
                  top: 50,
                  left: 5,
                  right: 5,
                  child: Image.asset(
                    widget.collection1["image"],
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 152,
                  left: 26,
                  child: Text(
                    widget.collection1["shortname"],
                    style: GoogleFonts.robotoSlab(
                        color: Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 25,
                  child: Text(
                    widget.collection1["names"],
                    style: GoogleFonts.robotoSlab(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 25,
                  child: TextButton(
                      onPressed: () {
                        // getdatafromfirestore();
                      },
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0))),
                            child: Text(
                              "SHOP NOW",
                              style: GoogleFonts.robotoSlab(
                                fontSize: 10,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            color: Colors.black,
                          )
                        ],
                      )),
                )
              ]),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Showallscreen(
                                name: "CHAIRS",
                                items: widget.collection2["chair"],
                              )));
                },
                child: Showallbutton(text: "Chairs(5)")),
            LimitedBox(
              maxHeight: height / 2.35,
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(thickness: 0.5, indent: width / 3.1),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Addtocart1(
                                            proName: widget.collection2["chair"]
                                                [index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(6)),
                              width: 90,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  widget.collection2["chair"][index]["image"],
                                  fit: BoxFit.fill,
                                  // widget.allitems["chair"]["image"]
                                  //
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8),
                                  child: Text(
                                    widget.collection2["chair"][index]["name"],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                ),
                              ),
                              Text(
                                widget.collection2["chair"][index]["price"]
                                    .toString(),
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.grey[400]),
                              ),
                            ],
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {
                                controller.storeCartItems(
                                    widget.collection2["chair"][index]["name"],
                                    widget.collection2["chair"][index]["image"],
                                    widget.collection2["chair"][index]
                                        ["price"]);
                              },
                              icon: Icon(
                                Icons.shopping_bag,
                                color: Color.fromARGB(255, 241, 71, 59),
                                size: 18,
                              )),
                        ],
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
                                name: "LAMPS",
                                items: widget.collection2["lamp"],
                              )));
                },
                child: Showallbutton(text: "Lamps(5)")),
            LimitedBox(
              maxHeight: height / 2.3,
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(thickness: 0.5, indent: width / 3.1),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Addtocart1(
                                            proName: widget.collection2["lamp"]
                                                [index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(6)),
                              width: 90,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  widget.collection2["lamp"][index]["image"],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8),
                                  child: Text(
                                    widget.collection2["lamp"][index]["name"],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                ),
                              ),
                              Text(
                                widget.collection2["lamp"][index]["price"]
                                    .toString(),
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.grey[400]),
                              ),
                            ],
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {
                                controller.storeCartItems(
                                    widget.collection2["lamp"][index]["name"],
                                    widget.collection2["lamp"][index]["image"],
                                    widget.collection2["lamp"][index]["price"]);
                              },
                              icon: Icon(
                                Icons.shopping_bag,
                                color: Color.fromARGB(255, 241, 71, 59),
                                size: 18,
                              )),
                        ],
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
                                name: "SOFAS",
                                items: widget.collection2["sofa"],
                              )));
                },
                child: Showallbutton(text: "Sofa(5)")),
            LimitedBox(
              maxHeight: height / 2.2,
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      Divider(thickness: 0.5, indent: width / 3.1),
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Addtocart1(
                                            proName: widget.collection2["sofa"]
                                                [index],
                                          )));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(6)),
                              width: 90,
                              height: 90,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                    widget.collection2["sofa"][index]["image"],
                                    fit: BoxFit.fill),
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8),
                                  child: Text(
                                    widget.collection2["sofa"][index]["name"],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                ),
                              ),
                              Text(
                                widget.collection2["sofa"][index]["price"]
                                    .toString(),
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.grey[400]),
                              ),
                            ],
                          ),
                          IconButton(
                              color: Colors.black,
                              onPressed: () {
                                controller.storeCartItems(
                                    widget.collection2["sofa"][index]["name"],
                                    widget.collection2["sofa"][index]["image"],
                                    widget.collection2["sofa"][index]["price"]);
                              },
                              icon: Icon(
                                Icons.shopping_bag,
                                color: Color.fromARGB(255, 241, 71, 59),
                                size: 18,
                              )),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
