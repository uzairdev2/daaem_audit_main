import 'package:daaem_reports/Core/Controller/btn_controller.dart/competitorPromotionStoringID.dart';
import 'package:daaem_reports/Core/Controller/btn_controller.dart/planogramFtnStroing.dart';
import 'package:daaem_reports/Core/Controller/storing_id_controller.dart';
import 'package:get/get.dart';

import 'bar_code_ftn.dart';
import 'btn_controller.dart/cleaningFtnStoringID.dart';
import 'btn_controller.dart/competitor_material.dart';
import 'btn_controller.dart/moreItemFtnStoringID.dart';
import 'btn_controller.dart/newItemFtnStoringID.dart';
import 'btn_controller.dart/osaFtnStoringID.dart';
import 'btn_controller.dart/priceLableFtnStoringId.dart';
import 'btn_controller.dart/printing_the_all_id.dart';
import 'btn_controller.dart/sceondaryFtnStoringID.dart';
import 'btn_controller.dart/stockbtnController.dart';
import 'checkbox_controller.dart';
import 'dropdown_controller.dart';
import 'image_controller.dart';

CheckController checkController = Get.put(CheckController());
PrintIdController printIdController = Get.put(PrintIdController());

SecondaryFtnController secondaryFtnController =
    Get.put(SecondaryFtnController());
CompetitiorMaterialFtnController competitiorMaterialFtnController =
    Get.put(CompetitiorMaterialFtnController());
PriceLabelController priceLabelController = Get.put(PriceLabelController());
CompetitorPromotionController competitorPromotionController =
    Get.put(CompetitorPromotionController());
StockLevelFtnBtn stockLevelFtnBtn = Get.put(StockLevelFtnBtn());
ImageContoller imageContoller = Get.put(ImageContoller());
NewItemController newItemController = Get.put(NewItemController());
MoreSpaceController moreSpaceController = Get.put(MoreSpaceController());
ProductDetailController productDetailController =
    Get.put(ProductDetailController());
HomeScreenController controller = Get.put(HomeScreenController());
PlanogramFtn planogramFtn = Get.put(PlanogramFtn());
CleaningFtnBtn cleaningFtnBtn = Get.put(CleaningFtnBtn());
CategorySelctedController categoryController =
    Get.put(CategorySelctedController());
ScanController scanController = Get.put(ScanController());
StoringIDController storingIDController = Get.put(StoringIDController());
