import 'package:bringin/Views/screens/OTPSent.dart';
import 'package:bringin/Views/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:bringin/Services/SendOTP.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController phoneController = TextEditingController();
    SendOTP sendOTPService = SendOTP();

    return Scaffold(
      body: Center(
          child: Column(
        children: [
          const Padding(padding: EdgeInsets.fromLTRB(0, 150, 0, 30)),
          CustomText(
            text: 'Sign In / Sign Up \nJob Seeker',
            fontSize: 28,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: CustomText(
                text:
                    'If you already have account you will be log in to your profile. '
                    'Otherwise you will be given the option to set a new profile.',
                fontSize: 14,
              )),
          Padding(
            padding: const EdgeInsets.all(20),
            child: IntlPhoneField(
              controller:phoneController,
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
            padding: const EdgeInsets.all(0),
            child: ElevatedButton(
              onPressed: () async{
                print(phoneController.text);
               await sendOTPService.sendOTP(phoneController);

                Get.to(() => OTPSent());
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white70),
              child: const Text('Send OTP'),
            ),
          )
        ],
      )),
    );
  }
}
