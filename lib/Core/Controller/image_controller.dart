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

  //  takeimageFile = Rx<File?>(null);

  List<Rx<File?>> takeimageFile = [];
  RxString takeBase64Image = ''.obs;

  Future<void> takeImage(int index) async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image != null) {
      takeimageFile.add(File(image.path) as Rx<File?>);
      takeimageFile[index].value = File(image.path);
      update();
      List<int> imageBytes = await takeimageFile[index].value!.readAsBytes();
      takeBase64Image.value = base64Encode(imageBytes);
      valueCheck2.value = true;
    } else {
      // Handle case when no image is captured
    }
  }
}
