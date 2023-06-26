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
      List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("priceLabelData");
    boxname.addAll(dataList);
    print("this is the PriceLabel List ${dataList}");
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
