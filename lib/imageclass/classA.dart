import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassA extends StatelessWidget {
  const ClassA({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/a0/55/b0/a055b0baa0a6cfeefa7bb9300ee04f36.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: 160,
            left: 25,
            child: Text(
              '''Make yourself
at home''',
              style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 30),
            ),
          ),
          Positioned(
            bottom: 120,
            left: 25,
            child: Text(
              """We love clean design and natural
furniture solutions""",
              style: GoogleFonts.robotoSlab(color: Colors.white, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
