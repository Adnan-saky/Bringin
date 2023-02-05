import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CircularImagePicker extends StatefulWidget {
  @override
  _CircularImagePickerState createState() => _CircularImagePickerState();
}

class _CircularImagePickerState extends State<CircularImagePicker> {
  var _selectedImage;
  XFile ? image;
  ImagePicker imagePicker = ImagePicker();
  Future<void> _onPictureSelection() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      child: GestureDetector(
        onTap: _onPictureSelection,
        child: CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 75,
          child: _selectedImage == null
              ? Icon(Icons.add_a_photo, size: 50)
              : ClipOval(
            child: Image.file(
              _selectedImage! ,
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
