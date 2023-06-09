// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageContoller extends GetxController {
  Rx<File?> cleanimageFile = Rx<File?>(null);
  RxString cleanBase64Image = ''.obs;
  RxBool valueCheck = false.obs;
  RxBool valueCheck2 = false.obs;
  List<RxBool> imagevalue = [];

  Future<void> cleanessImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      cleanimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await cleanimageFile.value!.readAsBytes();
      cleanBase64Image.value = base64Encode(imageBytes);
      valueCheck.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Rx<File?> takeimageFile = Rx<File?>(null);
  RxList<File> rowImages = <File>[].obs;
  RxString takeBase64Image = "".obs;

  Future<void> takeImage(int index) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      rowImages.add(File(image.path));
      takeimageFile.value = File(image.path);
      update();

      valueCheck2.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  takinkSpecficBase(int index) async {
    if (index >= 0 && index < rowImages.length) {
      List<int> imageBytes = await rowImages[index].readAsBytes();
      takeBase64Image.value = imageBytes as String;
    } else {
      print("sorry image is emplty");
    }
  }
}
