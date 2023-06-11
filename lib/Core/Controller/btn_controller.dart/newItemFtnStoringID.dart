// ignore_for_file: avoid_print, file_names

import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class NewItemController extends GetxController {
  RxString itemName = "".obs;
  RxString itemPrice = "".obs;
  RxString itemWeight = "".obs;
  RxString itemDiscription = "".obs;
  newItemFtnStoringID(
      String? itemName, itemPrice, itemWeight, discriptionOfitem) async {
    final boxname = await Hive.openBox("newItemData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("customerid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("itemName", itemName);
    boxname.put("itemPrice", itemPrice);
    boxname.put("itemWeight", itemWeight);
    boxname.put("itemDiscription", discriptionOfitem);
    boxname.close();
  }

// Future<void> newItemFtnStoringID() async {
//     final boxname = await Hive.openBox("newItemData");
//     boxname.put("itemName", itemName.value);
//     boxname.put("itemPrice", itemPrice.value);
//     boxname.put("itemExpiry", expiryItem.value);
//     boxname.put("itemDiscription", discriptionOfitem.value);
//   }
  newItemFtnGetingIDs() async {
    final boxname = await Hive.openBox("newItemData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("customerId");
    storingIDController.categoryid.value = boxname.get("categoryid");
    itemName = boxname.get("itemName");
    itemPrice = boxname.get("itemPrice");
    itemWeight = boxname.get("itemWeight");
    itemDiscription.value = boxname.get("itemDiscription");

    boxname.close();
  }
}
