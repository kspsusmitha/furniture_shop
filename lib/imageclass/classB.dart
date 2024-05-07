import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClassB extends StatelessWidget {
  const ClassB({
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
                      "https://i.pinimg.com/564x/79/1d/46/791d462b147038f22430219198572054.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: 210,
            left: 26,
            child: Text(
              "Cyber Monday",
              style: GoogleFonts.robotoSlab(
                  color: Colors.grey[500],
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            bottom: 80,
            left: 25,
            child: Text(
              """Sale Up To
70% Off""",
              style: GoogleFonts.robotoSlab(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
