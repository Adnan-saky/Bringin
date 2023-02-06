// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
//
// class CircularImagePickerController extends GetxController {
//
//
//   //  var path = ''.obs;
//   // File? _image;
//   // ImagePicker imagePicker = ImagePicker();
//   //
//   // Future<void> onPictureSelection() async {
//   //   final image  = await imagePicker.pickImage(source: ImageSource.gallery);
//   //   if (image  == null) return;
//   //
//   //   _image =  File(image.path);
//   //   path.value = _image!.path;
//   //   print(path.value);
//   //   print(_image.toString());
//   //   //update();
//   // }
// }
//
// class CircularImagePicker extends StatelessWidget {
//   final CircularImagePickerController controller = Get.put(CircularImagePickerController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: 150,
//       child: GestureDetector(
//         onTap: onPictureSelection,
//         child: CircleAvatar(
//           backgroundColor: Colors.grey[200],
//           radius: 75,
//           child:
//             // controller.path.value == null
//           //     ? Icon(Icons.add_a_photo, size: 50)
//           //     :
//              CircleAvatar(
//
//             backgroundImage: FileImage(File(controller.path.value)),
//             radius: 80,
//           )
//
//             ),
//           )
//
//     );
//   }
// }
