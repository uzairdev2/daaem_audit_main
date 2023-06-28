// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print, non_constant_identifier_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../database_name/db_name.dart';

class PrintIdController extends GetxController {
  Map<String, dynamic> planogramMap = {};
  Map<String, dynamic> cleaningMap = {};
  Map<String, dynamic> neighborsMap = {};
  Map<String, dynamic> productDetails = {};
  Map<String, dynamic> newitem = {};
  Map<String, dynamic> competitorPromotion = {};

  Future<Map> planogramDbHive() async {
    final box = await Hive.openBox(planogramDb);

    box.toMap().forEach((key, value) {
      // print('Key: $key,  $value');
      planogramMap[key.toString()] = value;
    });
    return box.toMap();
  }

  cleaningDbHive() async {
    final box = await Hive.openBox(cleaningDb);

    box.toMap().forEach((key, value) {
      cleaningMap[key.toString()] = value;
    });
  }

  neighborsDBHive() async{
    final box = await Hive.openBox(neighborsDb);
    box.toMap().forEach((key, value) {
      // print('Key: $key,  $value');
      neighborsMap[key.toString()] = value;
    });
  }

  product_Details() async {
    final box =await Hive.openBox(OsaDB);
    box.toMap().forEach((key, value) {
      // print('Key: $key,  $value');
      productDetails[key.toString()] = value;
    });
  }



  void priceLabelDbHive() async {
    final box = await Hive.openBox(priceLabelDb);
    if (box.isNotEmpty) {
      box.toMap().forEach((key, value) {
        print('Key: $key,  $value');
      });
      await box.close();
    } else {}
  }

   competitorPromotionDbHive() async {
    final box = await Hive.openBox(competitorPromotionDb);
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
      competitorPromotion[key.toString()] = value;
    });
    await box.close();
  }

  void moreSpaceDbHive() async {
    final box = await Hive.openBox(moreSpaceDb);
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
    });
    await box.close();
  }

   newItemDbHive() async {
    final box = await Hive.openBox(newItemDb);
    box.toMap().forEach((key, value) {
      print('Key: $key,  $value');
      newitem[key.toString()] = value;
    });
    await box.close();
  }

 

  
 
}
