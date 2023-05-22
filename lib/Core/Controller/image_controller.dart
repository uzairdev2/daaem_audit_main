import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageContoller extends GetxController {
  Rx<File?> imageFile = Rx<File?>(null);

  Future<void> proFile() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image != null) {
      imageFile.value = File(image.path);
    } else {
      // Handle case when no image is captured
    }
  }
}
