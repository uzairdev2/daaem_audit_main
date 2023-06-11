// ignore_for_file: avoid_print, file_names

import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class MoreSpaceController extends GetxController {
  RxString moreSpaceNotes = "".obs;
  RxString moreSpacePicture = "".obs;

  moreSpaceFtnStoringID(
    String? note,
  ) async {
    final boxname = await Hive.openBox("MoreSpaceData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("customerid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("note", note);
    boxname.put("moreSpacePicture", imageContoller.moreSpaceBase64Image.value);

    boxname.close();
  }

  moreSpaceFtnGetingIDs() async {
    final boxname = await Hive.openBox("MoreSpaceData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("customerId");
    storingIDController.categoryid.value = boxname.get("categoryid");
    moreSpaceNotes.value = boxname.get("itemName");
    moreSpacePicture.value = boxname.get("moreItemPicture");

    boxname.close();
  }
}
