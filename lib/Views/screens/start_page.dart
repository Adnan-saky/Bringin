import 'package:bringin/Views/screens/login_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  State<StartPage> createState() => _StartPage();
}
class _StartPage extends State<StartPage>{

  @override
  void initState() {
    // TODO: implement onInit
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((value) {
      Get.offAll(() => LoginSelect());
    });
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
