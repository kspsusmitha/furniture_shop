import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/screens/loginscreen.dart';
import 'package:irohub_project/screens/signupscreen.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({super.key});

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assets/dc86a5184cd92ed4f3620a8cf85cb796.jpg",
          fit: BoxFit.fill,
          height: double.infinity,
        ),
        Positioned(
          bottom: 90,
          left: 30,
          right: 30,
          child: Container(
            height: 50,
            width: width / 1.5,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Signupscreen()));
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(),backgroundColor: Colors.white),
              child: Text("Sign up",
                  style: GoogleFonts.aBeeZee(color: Colors.black)),
            ),
          ),
        ),
        Positioned(
          bottom: 30,
          left: 30,
          right: 30,
          child: Container(
            height: 50,
            width: width / 1.5,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Loginscreen()));
              },
              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(),backgroundColor: Colors.black),
              child: Text("LOGIN",
                  style: GoogleFonts.aBeeZee(color: Colors.white)),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: 50,
          right: 50,
          child: Image.asset(
            "assets/a__2_-removebg-preview (2).png",
            height: 220,
          ),
        )
      ],
    ));
  }
}
