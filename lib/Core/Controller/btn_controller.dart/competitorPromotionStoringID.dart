// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CompetitorPromotionController extends GetxController {
  RxString productID = "".obs;

  Future<void> competitorPromotionFtnStoringID(
      List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("CompetitorPromotionData");
    boxname.addAll(dataList);
    print("this is the CompetitorPromotionData List ${dataList}");
  }
}
