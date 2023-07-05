// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CompetitiorMaterialFtnController extends GetxController {
  Future<void> competitiorMaterialFtnStoringID(
      List<Map<String, dynamic>> dataList) async {
    print("Printing all data in competitor_material box:");

    final boxname = await Hive.openBox("competitor_material");
    boxname.clear();
    boxname.addAll(dataList);

    print("Printing all data in competitor_material box:");
    for (var value in boxname.values) {
      print(value);
    }
  }
}
