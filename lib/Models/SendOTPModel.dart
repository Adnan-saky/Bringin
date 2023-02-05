import 'package:get/get.dart';

class SendOTPModel extends GetxController{
  final String phone;
  final String role;

  SendOTPModel({ required this.phone,  required this.role});

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'role': role,
    };
  }
}
