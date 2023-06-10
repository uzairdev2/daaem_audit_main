import 'package:daaem_reports/Core/Controller/btn_controller.dart/planogramFtnStroing.dart';
import 'package:daaem_reports/Core/Controller/storing_id_controller.dart';
import 'package:get/get.dart';

import 'bar_code_ftn.dart';
import 'btn_controller.dart/cleaningFtnStoringID.dart';
import 'btn_controller.dart/locationFtnStoringID.dart';
import 'btn_controller.dart/osaFtnStoringID.dart';
import 'btn_controller.dart/stockbtnController.dart';
import 'checkbox_controller.dart';
import 'dropdown_controller.dart';
import 'image_controller.dart';

CheckController checkController = Get.put(CheckController());
StockLevelFtnBtn stockLevelFtnBtn = Get.put(StockLevelFtnBtn());
ImageContoller imageContoller = Get.put(ImageContoller());
LocationController locationController = Get.put(LocationController());
OsaFtnBTn osaFtnBTn = Get.put(OsaFtnBTn());
HomeScreenController controller = Get.put(HomeScreenController());
PlanogramFtn planogramFtn = Get.put(PlanogramFtn());
CleaningFtnBtn cleaningFtnBtn = Get.put(CleaningFtnBtn());
CategorySelctedController categoryController =
    Get.put(CategorySelctedController());
ScanController scanController = Get.put(ScanController());
StoringIDController storingIDController = Get.put(StoringIDController());
