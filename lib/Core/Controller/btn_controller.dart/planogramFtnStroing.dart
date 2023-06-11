// ignore_for_file: avoid_print, file_names

import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class PlanogramFtn extends GetxController {
  RxString planogramValue = ''.obs;
  RxBool radioValue = false.obs;
  void handleYesButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    planogramValue.value = gernder;
    update();
  }

  handleNoButtonClick(String gernder) {
    radioValue.value = !radioValue.value;
    planogramValue.value = gernder;
    update();
    print(planogramValue);
  }

  planogramFtnStoringID() async {
    final boxname = await Hive.openBox("planogramData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("custmoreid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    await boxname.put("planogramValue", planogramValue.value);
    boxname.close();
  }

  planogramFtnGetingIDs() async {
    final boxname = await Hive.openBox("planogramData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("custmoreid");
    storingIDController.categoryid.value = boxname.get("categoryid");
    planogramValue.value = boxname.get("planogramValue");
    print("value of geting function${planogramValue.value}");
    print(storingIDController.branchid.value);
    print(storingIDController.categoryid.value);
    boxname.close();
  }
}
