import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/screens/cartscreen.dart';
import 'package:irohub_project/screens/secondcollection.dart';


class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  @override
  void initState() {
    // TODO: implement initState
   super.initState();
    getdatafromthirdcollection();
  }

  var bigsale = [];
  getdatafromthirdcollection() async {
    var res = await FirebaseFirestore.instance
        .collection("collections")
        .doc("thirdcollections")
        .get();
    bigsale.addAll(res.data()?["Bigsale"]);
    print("hhhhhhhhhhhhhh ${res.data()}");
    print("3333333333333333 ${bigsale}");
  }
  var collection = [];
  var collection1 = [];
  getdatasfromfirestore() async {
    var res = await FirebaseFirestore.instance
        .collection("collections")
        .doc("allcollections")
        .get();
    collection.addAll(res.data()?["items"]);
    collection1.addAll(res.data()?["nextitems"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => cartscreen()));
                  },
                  icon: Icon(Icons.shopify_outlined, color: Colors.black),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Collection",
              style: GoogleFonts.robotoSlab(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          FutureBuilder(
              future: getdatasfromfirestore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LimitedBox(
                    maxHeight: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(4, 6),
                                    blurRadius: 3,
                                    color: Color.fromARGB(255, 213, 211, 211))
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[200],
                            ),
                            height: 200,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topRight,
                                    child: Image.asset(
                                      collection[index]["image"],
                                    )),
                                Positioned(
                                    top: 25,
                                    left: 10,
                                    child: Text(
                                      collection[index]["shortname"],
                                      style: GoogleFonts.robotoSlab(
                                          color: Colors.grey[400]),
                                    )),
                                Positioned(
                                    top: 45,
                                    left: 10,
                                    child: Text(
                                      collection[index]["names"],
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 25,
                                      ),
                                    )),
                                Positioned(
                                  bottom: 30,
                                  left: 25,
                                  child: TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Secondcollectionpage(
                                                      collection2:
                                                          bigsale[index],
                                                      collection1:
                                                          collection1[index],
                                                    )));
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
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Center(
                  heightFactor: 16,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              })
        ],
      ),
    );
  }
}
