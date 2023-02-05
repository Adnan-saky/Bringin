import 'package:bringin/Services/VarifyOTP.dart';
import 'package:flutter/material.dart';

import '../widgets/OTPInpute.dart';
import 'SignIn.dart';

// class OTPSent extends StatelessWidget {
//   const OTPSent({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
class OTPSent extends StatefulWidget {
  final String role ;
  final String ? phoneNumber ;
  OTPSent({Key? key, required this.role,  this.phoneNumber}) : super(key: key);

  @override
  State<OTPSent> createState() => _OTPSentState();
}

class _OTPSentState extends State<OTPSent> {
  // 4 text editing controllers that associate with the 4 input fields
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  // This is the entered code
  // It will be displayed in a Text widget
  String? otp;
  VarifyOTP varifyOTP = VarifyOTP();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Verify Phone',style: TextStyle(fontSize: 28),),
          const SizedBox(
            height: 30,
          ),
          const Text('Code is sent to',style: TextStyle(fontSize: 16),),
          const SizedBox(
            height: 30,
          ),
          // Implement 4 input fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              OtpInput(_fieldOne, true), // auto focus
              OtpInput(_fieldTwo, false),
              OtpInput(_fieldThree, false),
              OtpInput(_fieldFour, false)
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {

                setState(() {
                  otp = _fieldOne.text +
                      _fieldTwo.text +
                      _fieldThree.text +
                      _fieldFour.text;
                });
                varifyOTP.verifyOTP(
                    otpController: otp!,
                    phoneNumber: widget.phoneNumber ?? "",
                    role: widget.role
                );
                print(widget.role);
              },
              child: const Text('Submit')),
          const SizedBox(
            height: 30,
          ),
          // Display the entered OTP code
          Text(
            otp ?? 'Please enter OTP',
            style: const TextStyle(fontSize: 30),
          )
        ],
      ),
    );
  }
}