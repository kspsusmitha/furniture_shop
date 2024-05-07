import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/features/shop/controllers/cartcontroller.dart';

import 'package:irohub_project/screens/addtocart.dart';

class Showallscreen extends StatefulWidget {
  String name;
  final items;
  Showallscreen({super.key, required this.name, this.items});

  @override
  State<Showallscreen> createState() => _ShowallscreenState();
}

class _ShowallscreenState extends State<Showallscreen> {
  var size, height, width;

  final controller = Cartcontroller();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata();
    print("dddddddddddddddd ${widget.items}");
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                // Padding(
                //   padding: const EdgeInsets.only(top: 25),
                //   child: CarouselSlider.builder(
                //     itemCount: 3,
                //     itemBuilder: (context, index, realIndex) {
                //       return Container(
                //         margin: EdgeInsets.all(6),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(8.0),
                //           image: DecorationImage(
                //             image: NetworkImage(Carousilimage[index]),
                //             fit: BoxFit.cover,
                //           ),
                //         ),
                //       );
                //     },
                //     options: CarouselOptions(
                //       height: 180.0,
                //       enlargeCenterPage: true,
                //       autoPlay: true,
                //       aspectRatio: 16 / 9,
                //       autoPlayCurve: Curves.fastOutSlowIn,
                //       enableInfiniteScroll: true,
                //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                //       viewportFraction: 0.8,
                //     ),
                //   ),
                // ),
                // SizedBox(
                //   height: 30,
                // ),
                LimitedBox(
                  maxHeight: height,
                  child: GridView.builder(
                      itemCount: widget.items.length,
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 255),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 9.0, right: 9, top: 12, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Addtocart1(
                                                proName: widget.items[index],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(6)),
                                  width: 160,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          widget.items[index]["image"],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                            color: Colors.black,
                                            onPressed: () {
                                              controller.storeCartItems(
                                                  widget.items[index]["name"],
                                                  widget.items[index]["image"],
                                                  widget.items[index]["price"]);
                                            },
                                            icon: Icon(
                                              Icons.shopping_bag,
                                              color: Color.fromARGB(
                                                  255, 241, 71, 59),
                                              size: 18,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 18,
                                    child: Text(
                                      widget.items[index]["name"],
                                      style: GoogleFonts.robotoSlab(),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.items[index]["price"].toString(),
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ))
                            ],
                          ),
                        );
                      }),
                )
              ],
            )));
  }
}
