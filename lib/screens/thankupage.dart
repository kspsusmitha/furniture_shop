import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:irohub_project/googlemap.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:irohub_project/screens/orders.dart';
import 'package:lottie/lottie.dart';

class Thankyou extends StatelessWidget {
  const Thankyou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                "assets/Animation - 1705691768837.json",
                repeat: false,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Thank you!",
                  style: GoogleFonts.robotoSlab(fontSize: 30),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Orderscreen()));
                },
                child: Text("""         Your order is completed.
Please check the delivery status at
        # click to see your orders""",
                    style: GoogleFonts.robotoSlab(color: Colors.black)),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => googlemap()));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "VISIT OUR SHOP ",
                      style: GoogleFonts.robotoSlab(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: " click here",
                      style: GoogleFonts.robotoSlab(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ]))
                  //  Text(
                  //   "ORDER TRACKING click here",
                  //   style: GoogleFonts.robotoSlab(
                  //       color: Colors.black, fontWeight: FontWeight.w600),
                  // )
                  ),
              SizedBox(
                height: 120,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Homescreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.black),
                  child: Text(
                    "Continue shopping",
                    style: GoogleFonts.robotoSlab(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
