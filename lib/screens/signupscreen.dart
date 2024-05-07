// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/features/authentiation/signup/signupcontroller.dart';
import 'package:irohub_project/screens/loginscreen.dart';
import 'package:irohub_project/utils/validators/validation.dart';

// import 'loginscreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

// final db=FirebaseFirestore.instance;
//   createuser(){
//     db.collection("user").add({"fullname":_fullnamecontroller.text, "email":_emailcontroller.text,"password":_passwordcontroller.text
//     ,"phonenumber":_phonecontroller.text,});
//   }

class _SignupscreenState extends State<Signupscreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.cancel),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              "Personal details",
              style: GoogleFonts.robotoSlab(fontSize: 25),
            ),
          ),
          Form(
            key: controller.signupFormKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 13),
                  child: TextFormField(
                    validator: (value) =>
                        TValidator.validateEmptyText("Name", value),
                    controller: controller.namecontroller,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Name",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey[400]),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 13),
                  child: TextFormField(
                    validator: (value) => TValidator.validateEmail(value),
                    controller: controller.emailcontroller,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "email",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey[400]),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 13),
                  child: Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      validator: (value) => TValidator.validatePassword(value),
                      controller: controller.passwordcontroller,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(controller.hidePassword.value
                                ? Icons.visibility
                                : Icons.visibility_off)),
                        border: UnderlineInputBorder(),
                        labelText: "password",
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[400]),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 13),
                  child: TextFormField(
                    validator: (value) => TValidator.validatePhoneNumber(value),
                    controller: controller.phonenumbercontroller,
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "phonenumber",
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey[400]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.Signup();

                      // createuser();
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Loginscreen(),
                      //   ),
                      // );
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(),
                        backgroundColor: Colors.black),
                    child: Text(
                      "SIGN UP",
                      style: GoogleFonts.aBeeZee(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Loginscreen(),
                ),
              );
            },
            child: Text(
              "Already have an account? Sign in",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ]),
      ),
    ));
// Form(
//       key: controller.signupFormKey,
//         child: ListView(children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: Icon(Icons.cancel),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.all(50.0),
//         child: Text(
//           "Personal details",
//           style: GoogleFonts.robotoSlab(fontSize: 25),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
//         child: TextFormField(
//           validator: (value) => TValidator.validateEmptyText("Name",value),
//           controller: controller.namecontroller,
//           decoration: InputDecoration(
//             border: UnderlineInputBorder(),
//             labelText: "Name",
//             labelStyle:
//                 TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
//         child: TextFormField(
//            validator: (value) => TValidator.validateEmptyText("email",value),
//           controller: controller.emailcontroller,
//           decoration: InputDecoration(
//             border: UnderlineInputBorder(),
//             labelText: "email",
//             labelStyle:
//                 TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
//         child: Obx(
//         () => TextFormField(
//             obscureText: controller.hidePassword.value,
//              validator: (value) => TValidator.validateEmptyText("password",value),
//             controller: controller.passwordcontroller,
//             decoration: InputDecoration(
//               suffixIcon:IconButton(onPressed: ()=>
//                 controller.hidePassword.value= !controller.hidePassword.value,
//                icon: Icon(controller.hidePassword.value? Icons.visibility:Icons.visibility_off)) ,
//               border: UnderlineInputBorder(),
//               labelText: "password",
//               labelStyle:
//                   TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
//             ),
//           ),
//         ),
//       ),
//       Padding(
//         padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
//         child: TextFormField(
//            validator: (value) => TValidator.validateEmptyText("phonenumber",value),
//           controller: controller.phonenumbercontroller,
//           decoration: InputDecoration(
//             border: UnderlineInputBorder(),
//             labelText: "phonenumber",
//             labelStyle:
//                 TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
//           ),
//         ),
//       ),

//       SizedBox(
//         height: 60,
//       ),
//       Padding(
//         padding: const EdgeInsets.all(17.0),
//         child: ElevatedButton(
//           onPressed: () {
//             controller.Signup();
// // createuser();
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(
//             //     builder: (context) => Loginscreen(),
//             //   ),
//             // );
//           },
//           style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(),backgroundColor: Colors.black),
//           child: Text(
//             "SIGN UP",
//             style: GoogleFonts.aBeeZee(color: Colors.white),
//           ),
//         ),
//       ),
//       SizedBox(
//         height: 45,
//       ),
//       TextButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => Signupscreen(),
//             ),
//           );
//         },
//         child: Text(
//           "Already have an account? Sign in",
//           style: TextStyle(color: Colors.black),
//         ),
//       ),
//     ]));
  }
}
