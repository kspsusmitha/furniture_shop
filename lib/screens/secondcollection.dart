import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/extensions/screensize.dart';
import 'package:irohub_project/screens/thirdcollection.dart';

class Secondcollectionpage extends StatefulWidget {
  final collection1;
  final collection2;
  Secondcollectionpage(
      {super.key, required this.collection1, required this.collection2});

  @override
  State<Secondcollectionpage> createState() => _SecondcollectionpageState();
}

class _SecondcollectionpageState extends State<Secondcollectionpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("sssssssssss ${widget.collection2}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Collection",
          style: GoogleFonts.robotoSlab(fontSize: 30),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          height: context.Height(.63),
          // height: 506,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(8, 9),
                blurRadius: 10,
                color: Color.fromARGB(255, 119, 117, 117))
          ], borderRadius: BorderRadius.circular(15), color: Colors.grey[200]),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    widget.collection1["image"],
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.collection1["shortname"],
                      style: GoogleFonts.robotoSlab(
                          color: Colors.grey[500],
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.collection1["names"],
                      style: GoogleFonts.robotoSlab(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 8),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => thirdcollection(
                                        collection2: widget.collection2,
                                        collection1: widget.collection1,
                                      )));
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
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
