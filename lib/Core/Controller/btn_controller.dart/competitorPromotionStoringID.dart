// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../controller_detail.dart';

class CompetitorPromotionController extends GetxController {
  RxString? productID = "".obs;

  Future<void> competitorPromotionFtnStoringID(
      String regularPrice, String promotionalPrice) async {
    final boxname = await Hive.openBox("CompetitorPromotionData");
    boxname.put("table_name", 'CompetitorPromotion');
    boxname.put("retailerid", storingIDController.retailerid.value);
    boxname.put("branchid", storingIDController.branchid.value);
    boxname.put("custmoreid", storingIDController.custmoreid.value);
    boxname.put("categoryid", storingIDController.categoryid.value);
    boxname.put("priceProductid", storingIDController.priceProductID.value);

    boxname.put("regularPrice", regularPrice);
    boxname.put("promotonalPrice", promotionalPrice);
    boxname.put(
      "CompetitorPromotionPicture",
      imageContoller.promotionScreenBase64Image.value,
    );
  }
}
