import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'SignIn.dart';

class LoginSelect extends StatelessWidget {
  const LoginSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(0, 41, 0, 20)),
        const Text(
          'Choose Your Role',
          style: TextStyle(
            decoration: TextDecoration.none,
            fontSize: 23,
            color: Colors.black,
          ),
        ),
        const Padding(padding: EdgeInsets.fromLTRB(0, 41, 0, 20)),
        Image.asset('assets/img/img2.png'),
        const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
        ElevatedButton(
            onPressed: () {

              Get.to(SignIn());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.greenAccent,
            ),
            child: const Text("Join as Job Seeker")),
        const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 40)),
        Image.asset('assets/img/img1.png'),
        const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.greenAccent,
          ),
          child: const Text("Join as Recruiter"),
        ),
      ],
    );
  }
}
