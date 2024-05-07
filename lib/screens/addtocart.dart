import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/extensions/screensize.dart';
import 'package:irohub_project/features/shop/controllers/cartcontroller.dart';

class Addtocart1 extends StatefulWidget {
  final proName;
  var similarImages;

  Addtocart1({super.key, this.proName, this.similarImages});

  @override
  State<Addtocart1> createState() => _Addtocart1State();
}

class _Addtocart1State extends State<Addtocart1> {
  final namecontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final controller = Get.put(Cartcontroller());

  List description = ["Sku", "Categories", "Tags", "Dimension"];
  List description1 = [
    "545",
    "Furiniture,Accesories",
    "#furniture,#tables",
    "185 x 40 x 62 x cm (L x W x H)"
  ];
  List<Color> colors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.grey
  ];

  bool onclick = false;
  int itemcount = 0;
  int itemcount1 = 0;
  @override
  void initState() {
    super.initState();
  }

  var id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.black),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    )),
              ],
              title: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Tables",
                  style:
                      GoogleFonts.robotoSlab(color: Colors.black, fontSize: 20),
                ),
              ),
              backgroundColor: Colors.grey[200],
              snap: false,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                widget.proName["image"],
                fit: BoxFit.fill,
              )),
              expandedHeight: 600,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.proName["name"],
                        style: GoogleFonts.robotoSlab(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "₹ ",
                                style: TextStyle(color: Colors.grey[600])),
                            TextSpan(
                              text: widget.proName["price"].toString(),
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.red, fontSize: 20),
                            )
                          ])),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: FivePointedStar(
                              selectedColor: Color.fromARGB(255, 242, 159, 15),
                              onChange: (count) {
                                setState(() {
                                  itemcount = count;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Colors",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Stack(
                        children: [
                          SizedBox(
                            width: 400,
                            height: 50,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: colors.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          // selectedindex = index;
                                        });
                                      },
                                      child: CircleAvatar(
                                        radius: 20,
                                        backgroundColor: colors[index],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          Container(
                            width: 340,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.amberAccent.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Text(
                                "CURRENTLY UNAVAILABLE !",
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You may also like",
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                        ],
                      ),
                      LimitedBox(
                        maxHeight: 190,
                        child: ListView.builder(
                          itemCount: widget.proName.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, right: 8),
                              child: Stack(children: [
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) =>
                                    //             Addtocart1()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.circular(6)),
                                    width: 130,
                                    height: 150,
                                  ),
                                ),
                              ]),
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8, top: 8),
                        child: Text(
                            "Furniture enhances living spaces with functionality and style. From plush sofas offering relaxation to sturdy dining tables fostering shared meals, furniture shapes the ambiance of homes. Beds provide tranquil sanctuaries for rest, while coffee tables serve as focal points for gathering and conversation. With diverse designs and materials, furniture pieces blend practicality with aesthetics, elevating the comfort and charm of every room."),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LimitedBox(
                        maxHeight: 100,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  child: Text(
                                    "${description[index]} :",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Container(
                                  child: Text(
                                    description1[index],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 223,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Text(
                                  "Reviews",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "125",
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " reviews",
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: Colors.black,
                                        )
                                      ],
                                    )),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 9, top: 0),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.blue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "4.0",
                                            style: GoogleFonts.robotoSlab(
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Out of 5",
                                            style: GoogleFonts.robotoSlab(
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      chartRow(context, "  Excelent", 80),
                                      chartRow(context, "Very good", 60),
                                      chartRow(context, "    Average", 40),
                                      chartRow(context, "           Poor", 20),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              FivePointedStar(
                                defaultSelectedCount: 4,
                                selectedColor:
                                    Color.fromARGB(255, 242, 159, 15),
                                // size: Size.fromWidth(50),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Add a comment",
                                    style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Similar Items",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LimitedBox(
                        maxHeight: context.Height(.32),
                        maxWidth: 300,
                        child: ListView.builder(
                            itemCount: 4,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             Addtocart1()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        width: 160,
                                        height: 190,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          child: Image.network(
                                            widget.proName["image"],
                                            fit: BoxFit.fill,
                                            width: double.infinity,
                                            height: double.infinity,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          widget.proName["name"],
                                          style: GoogleFonts.robotoSlab(),
                                        )),
                                    RichText(
                                        text: TextSpan(children: [
                                      TextSpan(
                                          text: "₹ ",
                                          style: TextStyle(
                                              color: Colors.grey[600])),
                                      TextSpan(
                                        text: "${widget.proName["price"]}",
                                        style: GoogleFonts.robotoSlab(
                                            color: Colors.grey[400]),
                                      )
                                    ]))
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 9, right: 9, bottom: 10),
        child: Container(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () async {
                controller.storeCartItems(widget.proName["name"],
                    widget.proName["image"], widget.proName["price"]);
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.black),
              child: Text(
                "ADD TO CART",
                style: GoogleFonts.robotoSlab(color: Colors.white),
              )),
        ),
      ),
    );
  }

  Widget chartRow(BuildContext context, String label, int pct) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 8),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.robotoSlab(color: Colors.grey[500])),
          SizedBox(width: 8),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.34,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)),
                child: Text(''),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (pct / 100) * 0.34,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(''),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
