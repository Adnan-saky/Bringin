import 'package:flutter/material.dart';

class LoginSelect extends StatelessWidget {
  const LoginSelect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 41, 0, 20)),
          Image.asset('asstes/img/img1.png'),
          Padding(padding: EdgeInsets.fromLTRB(0, 20, 0, 20)),
          ElevatedButton(onPressed: (){}, child: Text("Join as Job Seeker")),
          Padding(padding: EdgeInsets.fromLTRB(0, 40, 0, 40)),
          Image.asset('asstes/img/img2.png'),
        ],
      ),
    );
  }
}
