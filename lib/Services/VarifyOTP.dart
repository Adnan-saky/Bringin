import 'package:bringin/Services/ApiConstants.dart';
import 'package:bringin/Views/screens/EditProfile.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class VarifyOTP{

  VarifyOTP();
  String? _token;


  String get token => _token!;

  set token(String value) {
    _token = value;
  }

  ApiConstants api = ApiConstants();


  Future<String?> fetchToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
// Saving the token
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

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
        final data = jsonDecode(response.body);
        _token = data["data"]["token"] as String;
        token = _token!;
        print(_token);
        print(phoneNumber);
        print(otpController);
        //saveToken(token!);

        final responseBody = jsonDecode(response.body);
        if (response.statusCode == 200 /*&& responseBody['status'] != false && responseBody['note'] != 'wrong credential' */) {
          final responseBody = jsonDecode(response.body);
          if (responseBody['message'] == 'Success !') {
            Get.to(() => EditProfile(token :_token!));
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