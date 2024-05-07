import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/extensions/screensize.dart';
import 'package:irohub_project/screens/addtocart.dart';
import 'package:irohub_project/screens/colections.dart';
import 'package:irohub_project/screens/showallscreen.dart';
import 'package:irohub_project/widget/textandshowall.dart';

class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  List exploreimage = [
    "https://i.pinimg.com/564x/79/91/58/799158da597625ffa054d48fecdef369.jpg",
    "https://i.pinimg.com/564x/f1/20/ba/f120ba0160225cf18a564a67e3bb22c6.jpg",
    "https://i.pinimg.com/564x/df/66/0e/df660ef6ec3351b9c8ef06606661893e.jpg"
  ];
  List discovername = ["Sofa", "Lamps", "Chair"];
  List discoveritem = ["10", "5", "6"];
  List newarrivals = [
    "assets/BLOTT WORKS - Handmade lamps and clocks - Shop.jpg",
    "assets/SOUTHERN LIGHT.jpg",
    "assets/Wood working projects woodworking plans__woodworking plans furniture.jpg"
  ];
  List carousilimage = [
    "assets/__ World Clock _ Elevenpl.jpg",
    "assets/Realistic Vintage School Wall Clock Sketch Freebie.jpg",
    "assets/fashiontoolsandmotorcycles.jpg"
  ];
  var trending = [];
  var bestselling = [];
  getdata() async {
    var res = await FirebaseFirestore.instance
        .collection("discoveritems")
        .doc("allitems")
        .get();
    trending.addAll(res.data()?["trending"]);
    bestselling.addAll(res.data()?["bestselling"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 60),
          child: Text(
            "Discover",
            style: GoogleFonts.robotoSlab(
                fontSize: 35, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        CarouselSlider.builder(
          itemCount: carousilimage.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(3, 2),
                      blurRadius: 4,
                      color: Color.fromARGB(255, 119, 117, 117))
                ],
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage(carousilimage[index]),
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Showallscreen(
                            name: "Trending",
                            items: trending,
                          )));
            },
            child: Showallbutton(text: "Trending")),
        FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return LimitedBox(
                  maxHeight: 322,
                  child: ListView.builder(
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(6)),
                                  width: 90,
                                  height: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        trending[index]["image"],
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 15),
                                        child: Text(
                                          trending[index]["name"],
                                          style: GoogleFonts.robotoSlab(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "₹ ",
                                              style: TextStyle(
                                                  color: Colors.grey[600])),
                                          TextSpan(
                                            text: trending[index]["price"]
                                                .toString(),
                                            style: GoogleFonts.robotoSlab(
                                                color: Colors.grey[400]),
                                          )
                                        ]))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Addtocart1(
                                                    proName: trending[index],
                                                  )));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(),
                                        backgroundColor: Colors.black),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0))),
                                      child: Center(
                                        child: Text(
                                          "SHOP NOW",
                                          style: GoogleFonts.robotoSlab(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }
              return Container(height: 322);
            }),
        LimitedBox(
          maxHeight: 266,
          child: ListView.builder(
              itemCount: newarrivals.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 250,
                          width: 300,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(8, 5),
                                    blurRadius: 10,
                                    color: Color.fromARGB(255, 119, 117, 117))
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200]),
                          child: Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.asset(
                                    newarrivals[index],
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  )),
                              Positioned(
                                  left: 25,
                                  top: 30,
                                  child: Text(
                                    "Collection",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey),
                                  )),
                              Positioned(
                                  left: 25,
                                  top: 65,
                                  child: Text(
                                    """New Arrivals
Winter""",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  )),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Showallscreen(
                            name: "Best Selling",
                            items: bestselling,
                          )));
            },
            child: Showallbutton(text: "Best Selling")),
        FutureBuilder(
            future: getdata(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return LimitedBox(
                  maxHeight: 322,
                  child: ListView.builder(
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(6)),
                                  width: 90,
                                  height: 90,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
                                      child: Image.network(
                                        bestselling[index]["image"],
                                        fit: BoxFit.fill,
                                      )),
                                ),
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8, top: 15),
                                        child: Text(
                                          bestselling[index]["name"],
                                          style: GoogleFonts.robotoSlab(
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.only(left: 8),
                                        child: RichText(
                                            text: TextSpan(children: [
                                          TextSpan(
                                              text: "₹ ",
                                              style: TextStyle(
                                                  color: Colors.grey[600])),
                                          TextSpan(
                                            text: bestselling[index]["price"]
                                                .toString(),
                                            style: GoogleFonts.robotoSlab(
                                                color: Colors.grey[400]),
                                          )
                                        ]))),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 55,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Addtocart1(
                                                    proName: bestselling[index],
                                                  )));
                                    },
                                    style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(),
                                        backgroundColor: Colors.black),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black,
                                                  width: 1.0))),
                                      child: Center(
                                        child: Text(
                                          "SHOP NOW",
                                          style: GoogleFonts.robotoSlab(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        );
                      }),
                );
              }
              return Container(height: 322);
            }),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: context.Height(0.39),
                  width: context.Height(.42),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            // offset: Offset(8, 5),
                            blurRadius: 10,
                            color: Color.fromARGB(255, 119, 117, 117))
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  child: Stack(
                    children: [
                      Image.asset(
                        "assets/zyro-images1.png",
                        width: 200,
                      ),
                      Positioned(
                          right: 25,
                          top: 30,
                          child: Text(
                            "Black Friday",
                            style: GoogleFonts.robotoSlab(color: Colors.grey),
                          )),
                      Positioned(
                          right: 35,
                          top: 50,
                          child: Text(
                            """SALE UP TO
       70% OFF""",
                            style: GoogleFonts.robotoSlab(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          )),
                      Positioned(
                        bottom: 30,
                        right: 25,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Collections()));
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
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
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
