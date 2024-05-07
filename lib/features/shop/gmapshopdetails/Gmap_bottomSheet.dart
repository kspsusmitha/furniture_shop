import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GmapBottomSheet {
  getshopdatas(BuildContext context) {
    int itemcount = 5;
    List<Icon> iconsList = [
      Icon(
        Icons.directions,
        color: Colors.blue,
      ),
      Icon(Icons.navigation_sharp, color: Colors.blue),
      Icon(Icons.add, color: Colors.blue)
    ];
    List iconText = ["Direction", "Start", "Post"];
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: ListView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 3.5,
                    width: 30,
                    decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("No Way furniture shop",
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black, fontSize: 20)),
              SizedBox(
                height: 15,
              ),
              FivePointedStar(
                selectedColor: Color.fromARGB(255, 242, 159, 15),
                onChange: (count) {
                  itemcount = count;
                },
              ),
              LimitedBox(
                maxHeight: 60,
                // MediaQuery.of(context).size.height * 0.1,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 30,
                  ),
                  // padding: EdgeInsets.only(left: 10, right: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 3.5,
                      // decoration: BoxDecoration(
                      //     color: Colors.blue,
                      //     borderRadius: BorderRadius.circular(15)),
                      // padding: EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          iconsList[index],
                          Text(
                            iconText[index],
                            style: GoogleFonts.robotoSlab(color: Colors.black),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Card(
                margin: EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Image.asset("assets/NO WAY HOME.jpg"),
              )
            ],
          ),
        );
      },
    );
  }
}
