import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Filterscreen extends StatefulWidget {
  const Filterscreen({super.key});

  @override
  State<Filterscreen> createState() => _FilterscreenState();
}

class _FilterscreenState extends State<Filterscreen> {
  List filterproducts = [
    "IKEA",
    "WoodenStreet",
    "HomeTown",
    "Godrej Interio",
    "Nilkamal"
  ];
  List categoriesname = [
    "Decoration",
    "Celling",
    "Floor",
    "Furniture",
    "Lamps",
    "Wooden"
  ];
  List<Product> filteredProducts = [];
  var minPrice = 0.0;
  var maxPrice = 100.00;
  List<Product> products = [
    Product(name: 'Product 1', price: 50.0),
    Product(name: 'Product 2', price: 30.0),
    // Add more products
  ];

  var selectedindex = -1;
  var selectedindex1 = -1;
  List Brandphoto = [
    "https://www.edigitalagency.com.au/wp-content/uploads/ikea-logo-png.png",
    "https://play-lh.googleusercontent.com/BPPve9zJLSuxvpu7IgKl0o6HPks_I0jijIO2EdWpuWPkzliNeE6c1k6DO60-AQppTg",
    "https://upload.wikimedia.org/wikipedia/commons/b/bc/Hometown-logo_-_Copy.jpg",
    "https://vectorlogoseek.com/wp-content/uploads/2020/04/godrej-interio-vector-logo.png"
  ];
  List Brandname = [
    "IKEA",
    "Godrej interior",
    "WoodenStreet",
    "HomeTown",
    "Nilkamal"
  ];
  List<Color> colors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.grey
  ];
  void roundedcolor() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.close,
              color: Colors.black,
            )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                child: Text(
                  "Filters",
                  style:
                      GoogleFonts.robotoSlab(color: Colors.black, fontSize: 25),
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5, bottom: 10),
                child: Text(
                  "Filter By Price",
                  style: GoogleFonts.robotoSlab(
                      color: Colors.grey[600], fontSize: 13),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RangeSlider(
                activeColor: Colors.black,
                values: RangeValues(
                    minPrice.clamp(0.00, 100.00), maxPrice.clamp(0.00, 100.00)),
                onChanged: (RangeValues values) {
                  setState(() {
                    minPrice = values.start;
                    maxPrice = values.end;
                  });
                },
                min: 0.00,
                max: 100.00,
                divisions: 100, // adjust as needed
                labels: RangeLabels(
                    '\$${minPrice.toString()}', '\$${maxPrice.toString()}'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 14, top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${minPrice.toString()}",
                      style:
                          GoogleFonts.robotoSlab(fontWeight: FontWeight.w500),
                    ),
                    Text("\$${maxPrice.toString()}",
                        style:
                            GoogleFonts.robotoSlab(fontWeight: FontWeight.w500))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  "Brand",
                  style: GoogleFonts.robotoSlab(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  leading: Image.asset(
                    "assets/icons8-brand-48.png",
                    height: 20,
                  ),
                  childrenPadding: EdgeInsets.only(bottom: 20),
                  title: Text(
                    "Top Brands",
                    style: GoogleFonts.robotoSlab(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_right),
                  children: [
                    SizedBox(
                      height: 50,
                      width: 400,
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Brandphoto.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedindex1 = index;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 115,
                                  decoration: BoxDecoration(
                                      color: selectedindex1 == index
                                          ? Colors.black
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundImage: NetworkImage(
                                            Brandphoto[index],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          Brandname[index],
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpansionTile(
                  leading: Image.asset(
                    "assets/icons8-categorize-50.png",
                    height: 20,
                  ),
                  childrenPadding: EdgeInsets.only(bottom: 20),
                  title: Text(
                    "Categories",
                    style: GoogleFonts.robotoSlab(color: Colors.black),
                  ),
                  trailing: Icon(Icons.arrow_right),
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesname.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(8),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedindex = index;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      color: selectedindex == index
                                          ? Colors.black
                                          : Colors.grey,
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // CircleAvatar(
                                        //   radius: 10,
                                        //   backgroundImage: AssetImage(
                                        //     "assets/icons8-ikea-144.png",
                                        //   ),
                                        // ),
                                        Text(
                                          categoriesname[index],
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 10),
                child: Text(
                  "Colors",
                  style: GoogleFonts.robotoSlab(color: Colors.black),
                ),
              ),
              SizedBox(
                width: 400,
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriesname.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.all(8),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedindex = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: colors[index],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 159,
              ),
              SizedBox(
                  height: 80.5,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Text(
                        "APPLY",
                        style: GoogleFonts.robotoSlab(color: Colors.white),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  String name;
  double price;

  Product({required this.name, required this.price});
}
