// ignore_for_file: avoid_print

import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class LocationController extends GetxController {
  RxString locationValue = ''.obs;
  RxBool radioValue = false.obs;
  void handleYesButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    locationValue.value = gernder;
    update();
  }

  handleNoButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    locationValue.value = gernder;
    update();
    print(locationValue);
  }

  locationFtnStoringID() async {
    final boxname = await Hive.openBox("locationData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("custmoreid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    await boxname.put("locationValue", locationValue.value);
    boxname.close();
  }

  locationFtnGetingIDs() async {
    final boxname = await Hive.openBox("locationData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("custmoreid");
    storingIDController.categoryid.value = boxname.get("categoryid");
    locationValue.value = boxname.get("locationValue");
    print("value of geting function${locationValue.value}");
    print(storingIDController.branchid.value);
    print(storingIDController.categoryid.value);
    boxname.close();
  }
}
