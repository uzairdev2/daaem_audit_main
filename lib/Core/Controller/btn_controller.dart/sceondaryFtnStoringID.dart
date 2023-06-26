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

  Future<void> promotionSecondaryFtnStoringID(
      List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("promotionSecondary");

    boxname.addAll(dataList);

    print("Printing all data in promotionSecondary box:");
    for (var value in boxname.values) {
      print(value);
    }
    print("this is the Promtion Secondary List ${dataList}");
  }
}
