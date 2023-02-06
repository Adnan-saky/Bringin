import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class EditProfileService {
  EditProfileService(this.token);
  String token;

  Future<void> updateProfile(
    TextEditingController  _firstNameController,
    TextEditingController _lastNameController,
    TextEditingController _genderController,
    TextEditingController _photoController,
    TextEditingController _portfolioURLController,
    TextEditingController _educationLevelController,
    TextEditingController _DOBController,
    TextEditingController _bioController,
    TextEditingController _isExperienceController,
    TextEditingController _skillsController,
    TextEditingController _greetingController
  ) async {
    // if (_formKey.currentState!.validate()) {
    //   setState(() {
    //     _loading = true;
    //   });
      print(token);

      try {
        var uri = Uri.tryParse("https://bringin.io/api/seekerProfileUpdate");
        if (uri == null) {
          throw Exception("Invalid URL");
        }

        final response = await http.post(
          uri,
          headers: {
            'Content-Type': 'application/json',
            'token': 'Bearer $token',
          },
          body: jsonEncode({
            'firstName': _firstNameController.text,
            'lastName': _lastNameController.text,
            'gender': _genderController.text,
            'photo': _photoController.text,
            'portfolioURL': _portfolioURLController.text,
            'educationLevel': _educationLevelController.text,
            'DOB': _DOBController.text,
            'bio': _bioController.text,
            'isExperience': _isExperienceController.text,
            'skills': _skillsController.text,
            'greeting': _greetingController.text,
          }),
        );

        print(response.body);
        if (response.statusCode == 201) {
          final data = jsonDecode(response.body);
          Get.snackbar(
            'Success',
            data['message'],
            duration: Duration(seconds: 2),
          );
        } else {
          final data = jsonDecode(response.body);
          Get.snackbar(
            'Error',
            data['message'],
            duration: Duration(seconds: 2),
          );
        }
      } catch (e) {

        Get.snackbar(
          'Error',
          'Failed to update profile',
          duration: Duration(seconds: 2),
        );
      }
    }
  }
}