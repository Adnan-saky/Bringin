
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class VarifyOTP{
  VarifyOTP();
  Future<void> verifyOTP(TextEditingController otpController,String phoneNumber,String role) async {

      try {
        var uri = Uri.tryParse("https://bringin.io/api/setLoginWithOTP");
        if (uri == null) {
          throw Exception("Invalid URL");
        }
        final response = await http.post(uri,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'phone': phoneNumber,
            'role': role,
            'otp': otpController.text,
          }),
        );
        print(response.statusCode);

        if (response.statusCode == 200) {
          Get.snackbar(
            'Success',
            'OTP Verified Successfully',
            duration: const Duration(seconds: 2),
          );
        } else {
          Get.snackbar(
            'Error',
            'Failed to verify OTP',
            duration: const Duration(seconds: 2),
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'Failed to verify OTP',
          duration: const Duration(seconds: 2),
        );
      }
      //Get.offAll(UserProfilePage());

  }
}