import 'package:get/get.dart';

import '../Local DB/model.dart';
import '../Local DB/openBox.dart';

class StoringIDController extends GetxController {
  RxString retailerid = "".obs;
  RxString branchid = "".obs;
  RxString custmoreid = "".obs;
  RxString categoryid = "".obs;
  void storingData() {
    final storedata = ModelHive(
      retailerId: retailerid.value,
      branchId: branchid.value,
      custmoreId: custmoreid.value,
      categoryId: categoryid.value,
    );
    final boxes = Boxes.getData();
    boxes.add(storedata).then((value) {
      print("idsave");
    }).onError((error, stackTrace) {
      Get.snackbar("Error", error.toString());
    });
  }
}
