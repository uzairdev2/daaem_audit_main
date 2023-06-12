// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../controller_detail.dart';

class SecondaryFtnController extends GetxController {
  RxString gandulaValue = ''.obs;
  RxString gandulapicture = ''.obs;
  RxBool gandularadioValue = false.obs;

  RxString floorValue = ''.obs;
  RxString floorpicture = ''.obs;

  RxBool florRadioValue = false.obs;

  RxString standValue = ''.obs;
  RxString standPicture = ''.obs;
  RxBool standRadioValue = false.obs;

  RxString areaValue = ''.obs;
  RxString areaPicture = ''.obs;
  RxBool areRadioValue = false.obs;

  void handleYesButtonClick(String gernder) {
    gandularadioValue.value = !gandularadioValue.value;
    gandulaValue.value = gernder;
    update();
  }

  handleNoButtonClick(String gernder) {
    gandularadioValue.value = !gandularadioValue.value;
    gandulaValue.value = gernder;
    update();
  }

  void floorHandleButtonClick(String gernder) {
    florRadioValue.value = !florRadioValue.value;
    floorValue.value = gernder;
    update();
  }

  void areaHandleButtonClick(String gernder) {
    areRadioValue.value = !areRadioValue.value;
    areaValue.value = gernder;
    update();
  }

  void standHandleButtonClick(String gernder) {
    standRadioValue.value = !standRadioValue.value;
    standValue.value = gernder;
    update();
  }

  Future<void> secomdayGandulaFtnStoringID() async {
    final boxname = await Hive.openBox("secondarygandulaData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("customerid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("priceProductid", storingIDController.priceProductID.value);
    boxname.put("gandulaImage", imageContoller.gandulaBase64Image.value);
    boxname.put(
      "gandulaValue",
      gandulaValue.value,
    );
  }

  secomdayGandulaFtnGetingIDs() async {
    final boxname = await Hive.openBox("secondarygandulaData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("customerid");
    storingIDController.categoryid.value = boxname.get("categoryid");
    storingIDController.priceProductID.value = boxname.get("priceProductid");
    gandulapicture.value = boxname.get("gandulaImage");
    gandulaValue.value = boxname.get("gandulaValue");
  }

  Future<void> secomdaryFloorFtnStoringID() async {
    final boxname = await Hive.openBox("secondaryFloorData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("customerid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("priceProductid", storingIDController.priceProductID.value);
    boxname.put("floorImage", imageContoller.floorBase64Image.value);
    boxname.put(
      "floorValue",
      floorValue.value,
    );
  }

  secondaryFloorFtnGetingIDs() async {
    final boxname = await Hive.openBox("secondaryFloorData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("customerid");
    storingIDController.categoryid.value = boxname.get("categoryid");
    storingIDController.priceProductID.value = boxname.get("priceProductid");
    floorpicture.value = boxname.get("floorImage");
    floorValue.value = boxname.get("floorValue");
  }

  Future<void> secondaryStandFtnStoringID() async {
    final boxname = await Hive.openBox("secondaryStandData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("customerid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("priceProductid", storingIDController.priceProductID.value);
    boxname.put("standImage", imageContoller.standBase64Image.value);
    boxname.put(
      "standValue",
      standValue.value,
    );
  }

  secondaryStandFtnGetingIDs() async {
    final boxname = await Hive.openBox("secondaryStandData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("customerid");
    storingIDController.categoryid.value = boxname.get("categoryid");
    storingIDController.priceProductID.value = boxname.get("priceProductid");
    standPicture.value = boxname.get("standImage");
    standValue.value = boxname.get("standValue");
  }

  Future<void> secondaryAreaFtnStoringID() async {
    final boxname = await Hive.openBox("secondaryAreaData");

    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("customerid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("priceProductid", storingIDController.priceProductID.value);
    boxname.put(
        "AreaImage", imageContoller.secondaryPromotionBass64Image.value);
    boxname.put(
      "AreaValue",
      areaPicture.value,
    );
  }

  secondaryAreaFtnGetingIDs() async {
    final boxname = await Hive.openBox("secondaryAreaData");

    storingIDController.retailerid.value = boxname.get("retailerid");
    storingIDController.branchid.value = boxname.get("branchid");
    storingIDController.custmoreid.value = boxname.get("customerid");
    storingIDController.categoryid.value = boxname.get("categoryid");
    storingIDController.priceProductID.value = boxname.get("priceProductid");
    areaPicture.value = boxname.get("AreaImage");
    areaValue.value = boxname.get("AreaValue");
  }
}
