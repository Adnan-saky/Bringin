import 'package:bringin/Services/ApiConstants.dart';
import 'package:bringin/Views/screens/EditProfile.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class VarifyOTP{

  VarifyOTP();
ApiConstants api = ApiConstants();
  Future<void> verifyOTP({required String otpController,required String phoneNumber}) async {

      try {
        var uri = Uri.tryParse('https://bringin.io/api/setLoginWithOTP');
        final response = await http.post(
          uri!,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            "phone": phoneNumber,
            "OTP": otpController
          }),
        );
        print('Status code: ${response.statusCode}');
        print('Body: ${response.body}');

        print(phoneNumber);
        print(otpController);

        final responseBody = jsonDecode(response.body);
        if (response.statusCode == 200 /*&& responseBody['status'] != false && responseBody['note'] != 'wrong credential' */) {
          final responseBody = jsonDecode(response.body);
          if (responseBody['message'] == 'Success !') {
            Get.to(() => EditProfile());
          Get.snackbar(
            'Success',
            'OTP Verified Successfully',
            duration: const Duration(seconds: 2),
          );
        }} else {
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