// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CompetitiorMaterialFtnController extends GetxController {
  Future<void> competitiorMaterialFtnStoringID(
      List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("competitor_material");

    boxname.addAll(dataList);

    print("Printing all data in promotionSecondary box:");
    for (var value in boxname.values) {
      print(value);
    }
    print("this is the Promtion Secondary List ${dataList}");
  }
}
