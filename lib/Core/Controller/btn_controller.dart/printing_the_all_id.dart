// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../database_name/db_name.dart';

class PrintIdController extends GetxController {
  void planogramDbHive() async {
    final box = await Hive.openBox(planogramDb);

    print("\\\\\\\\\\\\\\\\${planogramDb} throuh map ////////////////");
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
    });
    print("\\\\\\\\\\\\\\\\${planogramDb} End////////////////");
    await box.close();
  }

  void cleaningDbHive() async {
    final box = await Hive.openBox(cleaningDb);

    print("\\\\\\\\\\\\\\\\${cleaningDb} data////////////////");
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
    });
    print("\\\\\\\\\\\\\\\\${cleaningDb} End////////////////");
    await box.close();
  }

  void priceLabelDbHive() async {
    final box = await Hive.openBox(priceLabelDb);
    if (box.isNotEmpty) {
      print("\\\\\\\\\\\\\\\\${priceLabelDb} data////////////////");
      box.toMap().forEach((key, value) {
        print('Key: $key,  $value');
      });
      print("\\\\\\\\\\\\\\\\${priceLabelDb} End////////////////");
      await box.close();
    } else {
      print("\\\\\\\\\\\\\\\\${priceLabelDb} Empty////////////////");
    }
  }

  void competitorPromotionDbHive() async {
    final box = await Hive.openBox(competitorPromotionDb);
    print("\\\\\\\\\\\\\\\\${competitorPromotionDb} data////////////////");
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
    });
    print("\\\\\\\\\\\\\\\\${competitorPromotionDb} End////////////////");
    await box.close();
  }

  void moreSpaceDbHive() async {
    final box = await Hive.openBox(moreSpaceDb);
    print("\\\\\\\\\\\\\\\\${moreSpaceDb} data////////////////");
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
    });
    print("\\\\\\\\\\\\\\\\${moreSpaceDb} End////////////////");
    await box.close();
  }

  void newItemDbHive() async {
    final box = await Hive.openBox(newItemDb);
    print("\\\\\\\\\\\\\\\\${newItemDb} data////////////////");
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
    });
    print("\\\\\\\\\\\\\\\\${newItemDb} End////////////////");
    await box.close();
  }

  // void cleaningDbHive() async {
  //   final box = await Hive.openBox(cleaningDb);
  //   final allData = box.values.toList();
  //   print("\\\\\\\\\\\\\\\\${cleaningDb} data////////////////");
  //   for (final data in allData) {
  //     print(data.toString());
  //   }
  //   print("\\\\\\\\\\\\\\\\${cleaningDb} End////////////////");
  //   await box.close();
  // }
}
