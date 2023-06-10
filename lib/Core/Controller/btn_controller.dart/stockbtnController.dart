// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../controller_detail.dart';

class StockLevelFtnBtn extends GetxController {
  RxString stockValue = "".obs;
  RxBool radioValue = false.obs;
  void handleYesButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    stockValue.value = gernder;
    update();
  }

  handleNoButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    stockValue.value = gernder;
    update();
    print(stockValue.value);
  }

  // cleaningFtnStoringID({required String imagedata}) async {
  //   final boxname = await Hive.openBox("cleaningData");

  //   boxname.put("retailerid", storingIDController.retailerid.value);
  //   boxname.put("branchid", storingIDController.branchid.value);
  //   boxname.put("custmoreid", storingIDController.custmoreid.value);
  //   boxname.put("categoryid", storingIDController.categoryid.value);
  //   boxname.put("imagedata", imagedata);
  //   boxname.put(
  //     "cleaningValue",
  //     stockValue.value,
  //   );
  // }

  // Future<void> cleaningFtnGetingID() async {
  //   final boxname = await Hive.openBox("cleaningData");

  //   storingIDController.retailerid.value = boxname.get("retailerid");
  //   storingIDController.branchid.value = boxname.get("branchid");
  //   storingIDController.custmoreid.value = boxname.get("custmoreid");
  //   storingIDController.categoryid.value = boxname.get("categoryid");
  //   stockValue.value = boxname.get("cleaningValue");
  // }
}
