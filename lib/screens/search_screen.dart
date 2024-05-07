import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchscreen extends StatefulWidget {



  const Searchscreen({super.key});

  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Settime();
  }

  bool isloading=false;
 Future<void> Settime() async {
    setState(() {
      isloading = true;
    });
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      isloading==true ?
      SafeArea(child: Center(child: CircularProgressIndicator())):  Center(
        child: Align(
          alignment: 
          Alignment.center,
          child: Text(
                                              "CURRENTLY UNAVAILABLE !",
                                              style: GoogleFonts.robotoSlab(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}