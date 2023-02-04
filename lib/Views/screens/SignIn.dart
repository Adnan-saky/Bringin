import 'package:bringin/Views/screens/OTPSent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 30)),
          const Text(
            'Sign In / Sign Up \nJob Seeker',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              decoration: TextDecoration.none,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              'If you already have account you will be log in to your profile. '
              'Otherwise you will be given the option to set a new profile.',
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: IntlPhoneField(
              initialCountryCode: 'BD',
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  borderSide: BorderSide(),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(()=>OTPSent());
              },
              child: Text('Send OTP'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
            ),
          )
        ],
      )),
    );
  }
}
