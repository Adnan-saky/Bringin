import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

import '../widgets/imgpicker.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _genderController = TextEditingController();
  final _photoController = TextEditingController();
  final _portfolioURLController = TextEditingController();
  final _educationLevelController = TextEditingController();
  final _DOBController = TextEditingController();
  final _bioController = TextEditingController();
  final _isExperienceController = TextEditingController();
  final _skillsController = TextEditingController();
  final _greetingController = TextEditingController();
  bool _loading = false;



  Future<void> updateProfile() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _loading = true;
      });

      try {
        var uri = Uri.tryParse("https://bringin.io/api/seekerProfileUpdate");
        if (uri == null) {
          throw Exception("Invalid URL");
        }

        final response = await http.post(
          uri,
          headers: {
            'Content-Type': 'application/json',
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

        setState(() {
          _loading = false;
        });
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
        setState(() {
          _loading = false;
        });
        Get.snackbar(
          'Error',
          'Failed to update profile',
          duration: Duration(seconds: 2),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Profile"),
      ),
      body: _loading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
            child: Form(
        key: _formKey,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (CircularImagePicker()),
                TextFormField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                    labelText: "First Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your first name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your last name";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _genderController,
                  decoration: InputDecoration(
                    labelText: "Gender",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your gender";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _photoController,
                  decoration: InputDecoration(
                    labelText: "Photo URL",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your photo URL";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _portfolioURLController,
                  decoration: InputDecoration(
                    labelText: "Portfolio URL",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your portfolio URL";
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: _educationLevelController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Education Level",
                      //hintText: 'Enter Your Education Level',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your education level";
                      }
                      return null;
                    },
                  ),
                ),
                TextFormField(
                  controller: _DOBController,
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your date of birth";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _bioController,
                  decoration: InputDecoration(
                    labelText: "Bio",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your bio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _isExperienceController,
                  decoration: InputDecoration(
                    labelText: "experence",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your bio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _skillsController,
                  decoration: InputDecoration(
                    labelText: "Skills",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your bio";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _greetingController,
                  decoration: InputDecoration(
                    labelText: "greeting",
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your bio";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                  onPressed:  updateProfile,
                  child: Text("Update Profile"),
                ),
              ],
            ),
        ),
      ),
          ),
    );
  }
}

