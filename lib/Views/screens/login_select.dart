import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SignIn.dart';

class LoginSelect extends StatelessWidget {
  const LoginSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(padding: EdgeInsets.fromLTRB(0, 41, 0, 0)),
            const Text(
              'Choose Your Role',
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 30,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
            const Padding(padding: EdgeInsets.fromLTRB(0, 41, 0, 20)),
            Image.asset('assets/img/img2.png'),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            ElevatedButton(
                onPressed: () {

                  Get.to(() => SignIn());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                ),
                child: const Text("Join as Job Seeker")),
            const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 0)),
            Image.asset('assets/img/img1.png'),
            const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 0)),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
              ),
              child: const Text("Join as Recruiter"),
            ),
          ],
        ),
      ),
    );
  }
}
