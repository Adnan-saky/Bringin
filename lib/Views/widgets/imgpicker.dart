import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CircularImagePickerController extends GetxController {
  File? _image;
  ImagePicker imagePicker = ImagePicker();

  Future<void> onPictureSelection() async {
    var image  = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image  == null) return;
    final imageTemporary = File(image.path);
    _image = imageTemporary;
    print(_image.toString());
    update();
  }
}

class CircularImagePicker extends StatelessWidget {
  final CircularImagePickerController controller = Get.put(CircularImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: GestureDetector(
        onTap: controller.onPictureSelection,
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 75,
          child: controller._image == null
              ? Icon(Icons.add_a_photo, size: 50)
              : ClipOval(
            child: Image.file(
              controller._image!,
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
