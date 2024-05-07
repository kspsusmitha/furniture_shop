import 'package:flutter/material.dart';

class listviewbuilders extends StatelessWidget {
  final newarrivals;
  const listviewbuilders({super.key, required this.newarrivals});

  @override
  Widget build(BuildContext context) {
    return LimitedBox(
      maxHeight: 286,
      child: ListView.builder(
          itemCount: newarrivals.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6)),
                    width: 160,
                    child: Image.asset(
                      newarrivals[index],
                      width: 100,
                    ),
                    // child: Column(
                    //   children: [
                    //     // Container(
                    //     //   child: Image.asset(
                    //     //     newarrivals[index],
                    //     //     height: 160,
                    //     //     width: double.infinity,
                    //     //     fit: BoxFit.fill,
                    //     //   ),
                    //     // ),
                    //     // Text("Nancy chair"),
                    //     // Text("€29")
                    //   ],
                    // ),
                  ),
                ),
                Text("Nancy chair"),
                Text("€29")
              ],
            );
          }),
    );
  }
}
