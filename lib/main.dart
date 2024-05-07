import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/features/authentiation/login/logincontroller.dart';
import 'package:irohub_project/features/authentiation/signup/signupcontroller.dart';
import 'package:irohub_project/firebase/firebase_options.dart';
import 'package:irohub_project/screens/Firstscreen.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  shared_preferences_id;
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) {
    Get.put(UserRepository());
    Get.put(LoginController());
    Get.put(SignupController());
  });
  // await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
      // initialBinding:GenaralBinding() ,
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var finalEmail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSharedPreferenceData().whenComplete(() async {
      Timer(
          Duration(seconds: 2),
          () => Get.offAll(
              shared_preferences_id == null ? Firstscreen() : Homescreen()));
    });
    // getVaidationData().whenComplete(() async {
    //   Timer(Duration(seconds: 2),
    //       () => Get.offAll(finalEmail == null ? Firstscreen() : Homescreen()));
    // });
  }

  Future getSharedPreferenceData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var uid = preferences.getString("id");
    setState(() {
      shared_preferences_id = uid;
    });

    print('id is $shared_preferences_id');
  }

  // Future getVaidationData() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   var obtainedEmail = prefs.getString("email");
  //   setState(() {
  //     finalEmail = obtainedEmail;
  //   });
  //   print(finalEmail);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 250,
                  child: Image.asset(
                    "assets/a__2_-removebg-preview (2).png",
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "from",
                    style: TextStyle(color: Colors.white),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons8-google-144.png",
                    height: 20,
                  ),
                  Text(
                    "  google",
                    style: GoogleFonts.acme(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
