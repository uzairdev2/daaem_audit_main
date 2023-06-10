// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageContoller extends GetxController {
  Rx<File?> cleanimageFile = Rx<File?>(null);
  RxString cleanBase64Image = ''.obs;

  Rx<File?> gandulaimageFile = Rx<File?>(null);
  RxString gandulaBase64Image = ''.obs;
  RxBool gandulaValue = false.obs;

  Rx<File?> floorimageFile = Rx<File?>(null);
  RxString floorBase64Image = ''.obs;
  RxBool floorValue = false.obs;

  Rx<File?> standimageFile = Rx<File?>(null);
  RxString standBase64Image = ''.obs;
  RxBool standValue = false.obs;

  Rx<File?> promotionimageFile = Rx<File?>(null);
  RxString promotionBase64Image = ''.obs;
  RxBool promoValue = false.obs;

  Rx<File?> promotionScreenimageFile = Rx<File?>(null);
  RxString promotionScreenBase64Image = ''.obs;
  RxBool promotionScreenValue = false.obs;

  Rx<File?> materialimageFile = Rx<File?>(null);
  RxString materilaBase64Image = ''.obs;
  RxBool materialValue = false.obs;

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

  Future<void> gandulaImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      gandulaimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await gandulaimageFile.value!.readAsBytes();
      gandulaBase64Image.value = base64Encode(imageBytes);
      gandulaValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> floorImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      floorimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await floorimageFile.value!.readAsBytes();
      floorBase64Image.value = base64Encode(imageBytes);
      floorValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> standImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      standimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await standimageFile.value!.readAsBytes();
      standBase64Image.value = base64Encode(imageBytes);
      standValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> promoImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      promotionimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await promotionimageFile.value!.readAsBytes();
      promotionBase64Image.value = base64Encode(imageBytes);
      promoValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> promotionScreenImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      promotionScreenimageFile.value = File(image.path);
      update();
      List<int> imageBytes =
          await promotionScreenimageFile.value!.readAsBytes();
      promotionScreenBase64Image.value = base64Encode(imageBytes);
      promotionScreenValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> materialImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      materialimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await materialimageFile.value!.readAsBytes();
      materilaBase64Image.value = base64Encode(imageBytes);
      materialValue.value = true;
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
      final capturedFile = File(image.path);
      rowImages.add(capturedFile);
      takeimageFile.value = capturedFile;
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
