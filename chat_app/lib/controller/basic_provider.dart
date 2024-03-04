import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class BasicProvider extends ChangeNotifier {
  File? selectedImage;
  String? otpcode;
  imageSelector({required source}) async {
    final returnedimage = await ImagePicker().pickImage(source: source);
    selectedImage = File(returnedimage!.path);
    notifyListeners();
  }

  otpSetter(value) {
    otpcode = value;
    notifyListeners();
  }
}
