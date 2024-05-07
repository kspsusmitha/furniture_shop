import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:irohub_project/bottomnavigationclasses/discover.dart';
import 'package:irohub_project/bottomnavigationclasses/explore.dart';
import 'package:irohub_project/bottomnavigationclasses/home.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/screens/cartscreen.dart';
import 'package:irohub_project/screens/colections.dart';
import 'package:irohub_project/screens/loginscreen.dart';
import 'package:irohub_project/screens/profilepage.dart';
import 'package:irohub_project/screens/search_screen.dart';
import 'package:irohub_project/screens/showallscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var topdeals = [];
  List<Color> iconcolor = [Colors.white, Colors.black, Colors.black];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }

  var size, height, width;
  bool _isfavourite = false;
  int favouritecount = 0;
  void favourite() {
    setState(() {
      if (_isfavourite) {
        favouritecount -= 1;
        _isfavourite = false;
      } else {
        favouritecount += 1;
        _isfavourite = true;
      }
    });
  }

  int _selectedIndex = 0;
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void onitemindex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getitems() async {
    var res = await FirebaseFirestore.instance
        .collection("homescreenitems")
        .doc("allitems")
        .get();

    topdeals.addAll(res.data()?["topdeals"]);
  }

  var item = [];
  getcategories() async {
    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("categories")
        .get();

    item.addAll(res.data()?["exploreitems"]);
    // print("sssssssssss $item");
    setState(() {});
    return item;
  }

  String name = "";
  String email = "";
  getUserData() async {
    var res = await FirebaseFirestore.instance
        .collection("users")
        .doc(shared_preferences_id)
        .get();
    name = res["Fullname"];
    email = res["email"];
  }

  List screens = [Home(), Explorescreen(), Discover()];
  var finalprefs;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  Profilepage(name: name,email: email,)));
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://i.pinimg.com/564x/39/94/fb/3994fb52d1f983d003ed6f084366bdab.jpg"),
                      ),
                      title: Text(
                        name.toString(),
                        style: GoogleFonts.robotoSlab(),
                      ),
                      subtitle: Text(
                        email.toString(),
                        style: GoogleFonts.robotoSlab(
                            color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Row(
                    children: [
                      const Icon(Icons.home),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Home",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Collections()));
                  },
                  icon: Row(
                    children: [
                      const Icon(Icons.collections_bookmark_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Collections",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Showallscreen(
                                  name: "Top Trends",
                                  items: topdeals,
                                )));
                  },
                  icon: Row(
                    children: [
                      const Icon(Icons.deblur),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Top Deals",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: IconButton(
              //     onPressed: () {
              //       print("00000000000000000 ${item}");
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Sofascreen(
              //                     exploreimage: item,
              //                   )));
              //     },
              //     icon: Row(
              //       children: [
              //         Icon(Icons.category_rounded),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           "Categories",
              //           style: GoogleFonts.robotoSlab(),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    final SharedPreferences prefs1 =
                        await SharedPreferences.getInstance();
                    setState(() {
                      finalprefs = prefs;
                    });

                    try {
                      await GoogleSignIn().signOut();
                      await FirebaseAuth.instance.signOut();
                      prefs.remove("email");
                      prefs1.remove("id");
                      Get.offAll(() => Loginscreen());
                      print(prefs);
                      print("sss $prefs1");
                    } catch (e) {
                      print("somthing went wrong $e");
                    }
                  },
                  icon: Row(
                    children: [
                      Icon(Icons.logout_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign out",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            screens[_selectedIndex],
            ListTile(
              leading: IconButton(
                onPressed: () {
                  _openDrawer();
                  getitems();
                },
                icon: Icon(Icons.menu, color: Colors.black),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Searchscreen()));
                    },
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cartscreen()));
                    },
                    icon: Icon(
                      Icons.shopify_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.public_rounded), label: "")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: onitemindex,
      ),
    );
  }
}
