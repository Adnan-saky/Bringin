import 'package:bringin/Views/screens/EditProfile.dart';
import 'package:bringin/Views/screens/SignIn.dart';
import 'package:bringin/Views/screens/login_select.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../Views/screens/OTPSent.dart';
import '../Views/screens/start_page.dart';


class AllPages{
  static List<GetPage<dynamic>> pages() {
    return[
       GetPage(name: '/', page: () => const StartPage()),
       GetPage(name: '/second', page: () => const LoginSelect()),
       GetPage(name: '/third', page: () =>   SignIn(role: '',)),
      GetPage(name: '/fourth', page: () => OTPSent(role: '', phoneNumber: '',)),
      GetPage(name: '/fifth', page: () => EditProfile(token: '',))
    ];
  }

}