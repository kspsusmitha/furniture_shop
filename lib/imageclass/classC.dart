import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/screens/colections.dart';

class CLassC extends StatelessWidget {
  const CLassC({
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
                      "https://i.pinimg.com/564x/71/7f/83/717f83a9209df2e7471d07976e047f6b.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
          Positioned(
            top: 170,
            left: 25,
            child: Text(
              "Black Fridays",
              style: GoogleFonts.robotoSlab(
                  color: Colors.grey[500],
                  fontSize: 10,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Positioned(
            top: 180,
            left: 25,
            child: Text(
              """Sale Up To
70% Off""",
              style: GoogleFonts.robotoSlab(color: Colors.black, fontSize: 30),
            ),
          ),
          Positioned(
              bottom: 70,
              left: 25,
              child: Container(
                  height: 30,
                  width: 110,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Collections()));
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(),
                          backgroundColor: Colors.black),
                      child: Text("ShopNow",
                          maxLines: 1,
                          style: GoogleFonts.aBeeZee(color: Colors.white)))))
        ],
      ),
    );
  }
}
