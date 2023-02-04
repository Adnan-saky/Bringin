import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 150 ,  0, 30)),
          const Text(
            'Sign In / Sign Up\nJob Seeker ',
            style: TextStyle(
              decoration: TextDecoration.none,
              fontSize: 28,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
