import 'dart:async';

import 'package:bringin/Services/VarifyOTP.dart';
import 'package:bringin/Views/screens/EditProfile.dart';
import 'package:bringin/Views/screens/login_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  State<StartPage> createState() => StartPageState();
}
class StartPageState extends State<StartPage>{
  StartPageState();
  VarifyOTP varifyOTP = VarifyOTP();
   late String _token ;


  String get token =>  varifyOTP.token;

  set token(String value) {
    _token = value;
  }

  void whereToGo() async {
    var sharedPref = await SharedPreferences.getInstance();
    var isLoggedIn = sharedPref.getBool(token);


    // Timer(Duration(seconds: 3), () {
    //   if (isLoggedIn != null) {
    //     if (isLoggedIn) {
    //       Get.offAll(() => EditProfile(token: token));
    //     } else {
    //       Get.offAll(() => LoginSelect());
    //     }
    //   } else {
    //     Get.offAll(() => LoginSelect());
    //   }
    // });
  }
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {

        Get.offAll(() => LoginSelect());

    });

    //whereToGo();
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(0, 165, 0, 0)),
            Image.asset(
              'assets/logo/logo.png',
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Bringin',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 35,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const Text(
              'Instant Chat, Hire Direct',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            Center(
                child: LoadingAnimationWidget.prograssiveDots(
                  color: Colors.greenAccent,
                  size: 100,
                ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              'Bringin Technologies Ltd.',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ],
        ),
    );
  }
}
