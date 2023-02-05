import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Models/SendOTPModel.dart';
import '../widgets/customText.dart';
import 'SignIn.dart';

class LoginSelect extends StatelessWidget {
  const LoginSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String role;


    return Scaffold(
      body: SingleChildScrollView(
        physics : const ScrollPhysics(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 41, 0, 0),
                child: CustomText(
                  text: 'Choose Your Role',
                  fontSize: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 41, 0, 20),
                child: Image.asset('assets/img/img2.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      role = 'seekers';

                      print(role);

                      Get.to(() => SignIn(role: role));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent,
                    ),
                    child: const Text("Join as Job Seeker")),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Image.asset('assets/img/img1.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ElevatedButton(
                  onPressed: () {
                    role  = "recruiters";
                    print(role);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                  ),
                  child: const Text("Join as Recruiter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
