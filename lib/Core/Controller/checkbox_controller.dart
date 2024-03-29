// ignore_for_file: unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class CheckController extends GetxController {
  RxBool checkValue1 = false.obs;
  RxBool checkValue2 = false.obs;
  RxBool otherValue2 = false.obs;
  RxBool promositeValue2 = false.obs;
  RxBool gandulaCheckvalue = false.obs;
  RxBool floorCheckvalue = false.obs;
  RxBool standCheckValue = false.obs;
  RxBool areaCheckValue = false.obs;
  RxBool radioValue = false.obs;
  RxBool visable = false.obs;

  RxString selectRadioBtnVal = "".obs;

  void handleYesButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    selectRadioBtnVal.value = gernder;
  }

  handleNoButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    selectRadioBtnVal.value = gernder;

    (radioValue);
  }

  getDistance({
    required double lat,
    required double lon,
    Function? onConfirm,
  }) async {
    visable.value = true;
    Position p = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var cLat = p.latitude;
    var cLon = p.longitude;
    int distance;
    distance = Geolocator.distanceBetween(cLat, cLon, lat, lon) ~/ 1000;

    if (distance <= 1000) {
      onConfirm;
      visable.value = false;
    } else {
      var awayDistance = (distance / 1000).round();
      visable.value = false;
      Get.defaultDialog(
          title: "Warning",
          // content: Text("You are away from location ${awayDistance} KM"),
          content: const Text("You are away from location.."),
          textConfirm: "Ok",
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
            visable.value = false;
          });

      // Fluttertoast.showToast(
      //     msg: "You are away from location ${awayDistance} KM",
      //     toastLength: Toast.LENGTH_LONG,
      //     gravity: ToastGravity.CENTER);
    }
  }
}
