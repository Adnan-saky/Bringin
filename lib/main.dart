import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bringin/helper/pageRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GetPage<dynamic>> pagelist = page.pages();
    return GetMaterialApp(
      //home: OTPPage(),
      getPages: pagelist
      // [
      //   GetPage(name: '/', page: () => OTPPage()),
      //   GetPage(name: '/second', page: () => VerifyOTPPage()),
      //   GetPage(name: '/third', page: () => UserProfilePage()),
      //
      // ],
    );
  }
}


