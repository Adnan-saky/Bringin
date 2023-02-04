import 'package:flutter/material.dart';

class LoginSelect extends StatelessWidget {
  const LoginSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(padding: EdgeInsets.fromLTRB(0, 41, 0, 20)),
        Image.asset('assets/img/img2.png'),
        const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
        ElevatedButton(onPressed: (){}, child: const Text("Join as Job Seeker")),
        const Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 40)),
        Image.asset('assets/img/img1.png'),
        const Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
        ElevatedButton(onPressed: (){}, child: const Text("Join as Recruiter")),
      ],
    );
  }
}
