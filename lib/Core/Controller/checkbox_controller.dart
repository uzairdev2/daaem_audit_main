import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';

class CheckController extends GetxController {
  RxBool yesValue = false.obs;
  RxBool noValue = false.obs;
  Rx<File>? imageFile;
  Rx<File>? proFileImage;

  final ImagePicker _picker = ImagePicker();

  RxBool isYesSelected = false.obs;

  void selectYes() {
    isYesSelected.value = true;

    log("log yes no ${isYesSelected.value}");
  }

  void selectNo() {
    isYesSelected.value = false;
    log("log ${isYesSelected.value}");
  }

  proFile() async {
    final img =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 60);

    proFileImage = File(img!.path).obs;

    log("here is profile iamge $proFileImage");
    // await uploadProFile();
    // notifyListeners();
  }

  // yesValues(bool value) {
  //   yesValue.value = value;
  // }

  // noValues(bool value) {
  //   noValue.value = value;
  // }
}
