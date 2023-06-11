// ignore_for_file: avoid_print, file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../controller_detail.dart';

class PriceLabelController extends GetxController {
  RxString priceValue = ''.obs;
  RxBool radioValue = false.obs;
  RxString priceImage = "".obs;
  RxString regularPrice = "".obs;
  RxString promotionalPrice = "".obs;
  void handleYesButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    priceValue.value = gernder;
    update();
  }

  handleNoButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    priceValue.value = gernder;
    update();
    print(priceValue);
  }

  Future<void> priceLabelFtnStoringID(
      String regularPrice, String promotionalPrice) async {
    final boxname = await Hive.openBox("priceLabelData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("custmoreid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("priceProductid", storingIDController.priceProductID.value);
    boxname.put(
        "priceImage", imageContoller.secondaryPromotionBass64Image.value);
    boxname.put("regularPrice", regularPrice);
    boxname.put("promotonalPrice", promotionalPrice);
    boxname.put(
      "priceLabelValue",
      priceValue.value,
    );
  }

  priceLabelFtnGetingIDs() async {
    final boxname = await Hive.openBox("priceLabelData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("custmoreid");
    storingIDController.categoryid.value = boxname.get("categoryid");
    storingIDController.priceProductID.value = boxname.get("priceProductid");
    priceImage.value = boxname.get("priceImage");
    regularPrice.value = boxname.get("regularPrice");
    promotionalPrice.value = boxname.get("promotonalPrice");
    priceValue.value = boxname.get("priceLabelValue");
  }
}
