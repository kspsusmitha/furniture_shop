import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Giftcard extends StatefulWidget {
  Giftcard({super.key});

  @override
  State<Giftcard> createState() => _GiftcardState();
}

class _GiftcardState extends State<Giftcard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Settime();
  }

  bool isloading = false;
  Future<void> Settime() async {
    setState(() {
      isloading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isloading = false;
    });
  }

  var size, height, width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          // leading: Icon(
          //   Icons.arrow_back,
          //   color: Colors.black,
          // ),
          title: Text(
            "Gift card & vouchers",
            style: GoogleFonts.robotoSlab(color: Colors.black),
          ),
        ),
        body: Center(
          child: isloading
              ? CircularProgressIndicator(
                  color: Colors.black,
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/Screenshot_2023-12-07-18-47-05-161_com.android.jpg.jpg",
                        height: height / 4.8,
                      ),
                      Text(
                        "You've caught up with everyting",
                        style:
                            GoogleFonts.robotoSlab(fontWeight: FontWeight.w400),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "This is where you'll see notifications in your account",
                          style: GoogleFonts.robotoSlab(
                              fontWeight: FontWeight.w300),
                        ),
                      )
                    ],
                  ),
                ),
        ));
  }
}
