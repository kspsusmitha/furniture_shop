import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroller = TextEditingController();

class _ForgetpasswordState extends State<Forgetpassword> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        body: ListView(children: [
      Align(
        alignment: Alignment.topLeft,
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.cancel),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            "Forget password",
            style: GoogleFonts.robotoSlab(fontSize: 25),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
        child: Text(
          "Please enter your email address.You will recive a link to create a new password by email",
          maxLines: 3,
          style: TextStyle(fontWeight: FontWeight.w300),
          textAlign: TextAlign.center,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
        child: TextFormField(
          controller: _emailcontroller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "Email",
            labelStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
          ),
        ),
      ),
    ]));
  }
}
