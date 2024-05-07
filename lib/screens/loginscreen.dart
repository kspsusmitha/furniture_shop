import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/features/authentiation/login/logincontroller.dart';
import 'package:irohub_project/screens/forgetpassword.dart';
import 'package:irohub_project/screens/signupscreen.dart';
import 'package:irohub_project/utils/validators/validation.dart';


class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  static Loginscreen get instance => Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                  "Login",
                  style: GoogleFonts.robotoSlab(fontSize: 25),
                ),
              ),
              Form(
                  key: controller.loginFormKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          validator: (value) =>
                              TValidator.validateEmptyText("emaill", value),
                          controller: controller.emailcontroller,
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "email",
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[400]),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: Obx(
                          () => TextFormField(
                            obscureText: controller.hidePassword.value,
                            validator: (value) =>
                                TValidator.validateEmptyText("password", value),
                            controller: controller.passwordcontroller,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () => controller.hidePassword
                                      .value = !controller.hidePassword.value,
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
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            controller.signIn();
                            print("value is $shared_preferences_id");
                            // print("email $finalEmail");
                            // getSharedPreferenceData();
                            // print("fuck you $shared_preferences_id");
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              backgroundColor: Colors.black),
                          child: Text(
                            "LOGIN",
                            style: GoogleFonts.aBeeZee(color: Colors.white),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Forgetpassword()));
                        },
                        child: Text(
                          "forget your password ?",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            // prefs.setString("id", shared_preferences_id);
                            controller.googleSignIn();

                            // try {
                            //   facebooksignin();
                            //   if (context.mounted) {
                            //     Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) => Signupscreen()));
                            //   }
                            // } catch (e) {
                            //   MotionToast.error(description: Text("error")).show(context);
                            // }
                            // facebooksignin();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(),
                              backgroundColor: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icons8-google-48.png",
                                height: 17,
                              ),
                              Text(
                                " LOGIN WITH GOOGLE",
                                style: GoogleFonts.aBeeZee(color: Colors.blue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          // controller1.Signup();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signupscreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Don't have an account? Sign Up",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
