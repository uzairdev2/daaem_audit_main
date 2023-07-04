// ignore_for_file: unnecessary_null_comparison, avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageContoller extends GetxController {
  Rx<File?> cleanimageFile = Rx<File?>(null);
  RxString cleanBase64Image = ''.obs;
  RxBool cleaningValueImage = false.obs;

  Rx<File?> promotionalimageFile = Rx<File?>(null);
  RxString promotionalBase64Image = ''.obs;
  RxBool promotionalValue = false.obs;

  Rx<File?> gandulaimageFile = Rx<File?>(null);
  RxString gandulaBase64Image = ''.obs;
  RxBool gandulaValue = false.obs;

  Rx<File?> floorimageFile = Rx<File?>(null);
  RxString floorBase64Image = ''.obs;
  RxBool floorValue = false.obs;

  Rx<File?> areaImage = Rx<File?>(null);
  RxString areaBase64 = ''.obs;
  RxBool areavalue = false.obs;

  Rx<File?> moreSpaceimageFile = Rx<File?>(null);
  RxString moreSpaceBase64Image = ''.obs;
  RxBool moreSpaceValue = false.obs;

  Rx<File?> standimageFile = Rx<File?>(null);
  RxString standBase64Image = ''.obs;
  RxBool standValue = false.obs;

  Rx<File?> secondaryPromotionFile = Rx<File?>(null);
  RxString secondaryPromotionBass64Image = ''.obs;
  RxBool secondaryPromValue = false.obs;

  Rx<File?> competitorPromtionImageFile = Rx<File?>(null);
  RxString competitorPromotionBase64 = ''.obs;
  RxBool competitorPromotionValue = false.obs;

  Rx<File?> materialimageFile = Rx<File?>(null);
  RxString materilaBase64Image = ''.obs;
  RxBool materialValue = false.obs;

  RxBool valueCheck = false.obs;
  RxBool valueCheck2 = false.obs;
  List<RxBool> imagevalue = [];

  Future<void> cleanessImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 50);
    if (image != null) {
      cleanimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await cleanimageFile.value!.readAsBytes();
      cleanBase64Image.value = base64Encode(imageBytes);
      cleaningValueImage.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> moreSpaceImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera, imageQuality: 60);
    if (image != null) {
      moreSpaceimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await moreSpaceimageFile.value!.readAsBytes();
      moreSpaceBase64Image.value = base64Encode(imageBytes);
      moreSpaceValue.value = true;
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

  Future<void> promotionAreaImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      areaImage.value = File(image.path);
      update();
      List<int> imageBytes = await areaImage.value!.readAsBytes();
      areaBase64.value = base64Encode(imageBytes);
      areavalue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> promotionalImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      promotionalimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await promotionalimageFile.value!.readAsBytes();
      promotionalBase64Image.value = base64Encode(imageBytes);
      promotionalValue.value = true;
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
      secondaryPromotionFile.value = File(image.path);
      update();
      List<int> imageBytes = await secondaryPromotionFile.value!.readAsBytes();
      secondaryPromotionBass64Image.value = base64Encode(imageBytes);
      secondaryPromValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Future<void> promotionScreenImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      competitorPromtionImageFile.value = File(image.path);
      update();
      List<int> imageBytes =
          await competitorPromtionImageFile.value!.readAsBytes();
      competitorPromotionBase64.value = base64Encode(imageBytes);
      competitorPromotionValue.value = true;
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

  Rx<File?> materialgandulaimageFile = Rx<File?>(null);
  RxString materialgandulaBase64Image = ''.obs;
  RxBool materialgandulaValue = false.obs;

  Future<void> materialGandulaImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      materialgandulaimageFile.value = File(image.path);
      update();
      List<int> imageBytes =
          await materialgandulaimageFile.value!.readAsBytes();
      materialgandulaBase64Image.value = base64Encode(imageBytes);
      materialgandulaValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Rx<File?> materialfloorimageFile = Rx<File?>(null);
  RxString materialfloorBase64Image = ''.obs;
  RxBool materialfloorValue = false.obs;
  Future<void> materiaFloorImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      materialfloorimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await materialfloorimageFile.value!.readAsBytes();
      materialfloorBase64Image.value = base64Encode(imageBytes);
      materialfloorValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Rx<File?> materialPromositeimageFile = Rx<File?>(null);
  RxString materialPromositeBase64Image = ''.obs;
  RxBool materialPromositeValue = false.obs;
  Future<void> materialPromositeImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      materialPromositeimageFile.value = File(image.path);
      update();
      List<int> imageBytes =
          await materialPromositeimageFile.value!.readAsBytes();
      materialPromositeBase64Image.value = base64Encode(imageBytes);
      materialPromositeValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }

  Rx<File?> materialOtherimageFile = Rx<File?>(null);
  RxString materialOtherBase64Image = ''.obs;
  RxBool materialOtherValue = false.obs;
  Future<void> materialOtherImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      materialOtherimageFile.value = File(image.path);
      update();
      List<int> imageBytes = await materialOtherimageFile.value!.readAsBytes();
      materialOtherBase64Image.value = base64Encode(imageBytes);
      materialOtherValue.value = true;
    } else {
      // Handle case when no image is captured
    }
  }
}
