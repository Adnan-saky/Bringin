import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
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
          const SizedBox(
            height: 300,
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
