import 'package:daaem_reports/Core/Controller/btn_controller.dart/planogramFtnStroing.dart';
import 'package:daaem_reports/Core/Controller/storing_id_controller.dart';
import 'package:get/get.dart';

import 'bar_code_ftn.dart';
import 'btn_controller.dart/cleaningFtnStoringID.dart';
import 'checkbox_controller.dart';
import 'dropdown_controller.dart';
import 'image_controller.dart';

CheckController checkController = Get.put(CheckController());
ImageContoller imageContoller = Get.put(ImageContoller());
HomeScreenController controller = Get.put(HomeScreenController());
PlanogramFtn planogramFtn = Get.put(PlanogramFtn());
CleaningFtnBtn cleaningFtnBtn = Get.put(CleaningFtnBtn());
CategorySelctedController categoryController =
    Get.put(CategorySelctedController());
ScanController scanController = Get.put(ScanController());
StoringIDController storingIDController = Get.put(StoringIDController());
