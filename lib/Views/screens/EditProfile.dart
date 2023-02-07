import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/imgpicker.dart';

class EditProfile extends StatelessWidget {

  final String token;
  EditProfile({required this.token});
  //final File selectedImage  = File('');
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final genderController = TextEditingController().obs;
  final photoController = TextEditingController().obs;
  final portfolioURLController = TextEditingController().obs;
  final educationLevelController = TextEditingController().obs;
  final DOBController = TextEditingController().obs;
  final bioController = TextEditingController().obs;
  final isExperienceController = TextEditingController().obs;
  final skillsController = TextEditingController().obs;
  final greetingController = TextEditingController().obs;
  final formKey = GlobalKey<FormState>();
  final loading = false.obs;

  var path = ''.obs;
  File ? _image;
  ImagePicker imagePicker = ImagePicker();

  Future<void> onPictureSelection() async {
    final image  = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image  == null) return;

    _image =  File(image.path);
    path.value = _image!.path;
    print(path.value);
    print(_image.toString());


  }

  Future<void> updateProfile() async {


// Fetching the token

    print("asdasdasdasdasdsadasdsadasdwebwasdaeweggsdgsdgsdg");

      loading.value = true;
      print(token);


        var uri = Uri.tryParse('https://bringin.io/api/seekerProfileUpdate');
        if (uri == null) {
          throw Exception("Invalid URL");
        }

        final response = await http.post(
          uri,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: jsonEncode({
            'firstName': firstNameController.value.text,
            'lastName': lastNameController.value.text,
            'gender': genderController.value.text,
            'photo': _image,

            'educationLevel': educationLevelController.value.text,
            'DOB': DOBController.value.text,
            'bio': bioController.value.text,
            'isExperience': isExperienceController.value.text,
            'skills': skillsController.value.text,
            'greeting': greetingController.value.text,
          }),
        );
        print("asdasdasdasdasdsadasdsadasdwebwasdaeweggsdgsdgsdg");
        print(response.statusCode);

        loading.value = false;
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
      // } catch (e) {
      //   loading.value = false;
      //   Get.snackbar(
      //     'Error',
      //     'Failed to update profile',
      //     duration: Duration(seconds: 2),
      //   );
      // }
      loading.value = false;

  }


      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Update Profile"),
          ),
          body: loading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              : SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (Container(
                        height: 150,
                        width: 150,
                        child: GestureDetector(
                          onTap: onPictureSelection,
                          child: CircleAvatar(
                              backgroundColor: Colors.grey[200],
                              radius: 75,
                              child:
                              // controller.path.value == null
                              //     ? Icon(Icons.add_a_photo, size: 50)
                              //     :
                              CircleAvatar(

                                backgroundImage: FileImage(File(path.value)),
                                radius: 80,
                              )

                          ),
                        )

                    )),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: firstNameController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "First Name",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: lastNameController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Last Name",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: genderController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Gender",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: portfolioURLController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Portfolio URL",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: educationLevelController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Education Level",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: DOBController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "DOB",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: bioController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Bio",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: isExperienceController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Is Experienced",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: skillsController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Skills",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        controller: greetingController.value,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Greeting",
                          //hintText: 'Enter Your Education Level',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Error";
                          }
                          return null;
                        },
                      ),
                    ),

                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: () => updateProfile(),
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





