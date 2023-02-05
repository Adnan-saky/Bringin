import 'package:bringin/Services/ApiConstants.dart';
import 'package:bringin/Views/screens/OTPSent.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SendOTP{
  final String role;
  SendOTP(this.role);
  Future<void> sendOTP(TextEditingController phoneController ) async {
      try {
        var uri = Uri.tryParse(ApiConstants.baseUrl+ApiConstants.sendOTP);
        final response = await http.post(
          uri!,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode({
            'phone': phoneController.text,
            'role': role,
          }),
        );
        print('Status code: ${response.statusCode}');
        print('Body: ${response.body}');

        if (response.statusCode == 200) {
          Get.snackbar(
              'Success',
              'OTP Sent Successfully',
              duration: const Duration(seconds: 2),
              backgroundColor: Colors.greenAccent);
          Get.to(() =>OTPSent(role: role,phoneNumber: phoneController.text,));

        } else {
          print("Trying to send OTP");
        }

      } catch (e) {
        Get.snackbar(
          backgroundColor: Colors.redAccent,
          'Error',
          'Failed to verify OTP',
          duration: const Duration(seconds: 2),
        );

      }


  }
}