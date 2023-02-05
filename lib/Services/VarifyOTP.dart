import 'package:bringin/Services/ApiConstants.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class VarifyOTP{

  VarifyOTP();
ApiConstants api = ApiConstants();
  Future<void> verifyOTP({required String otpController,required String phoneNumber,required String role}) async {

      try {
        var uri = Uri.tryParse(ApiConstants.baseUrl+ApiConstants.setLoginWithOTP);
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
            'otp': otpController,
          }),
        );
        print("Response");
        print(response.body);
        final responseBody = jsonDecode(response.body);
        if (response.statusCode == 200 /*&& responseBody['status'] != false && responseBody['note'] != 'wrong credential' */) {
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