import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/pageRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GetPage<dynamic>> pageList = AllPages.pages();
    return GetMaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.dark,
        //home: OTPPage(),
        getPages: pageList
        // [
        //   GetPage(name: '/', page: () => OTPPage()),
        //   GetPage(name: '/second', page: () => VerifyOTPPage()),
        //   GetPage(name: '/third', page: () => UserProfilePage()),
        //
        // ],
        );
  }
}
