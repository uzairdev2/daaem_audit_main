import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class StoringIDController extends GetxController {
  RxString retailerid = "".obs;
  RxString branchid = "".obs;
  RxString custmoreid = "".obs;
  RxString categoryid = "".obs;

  Future<void> planogramFtnStoringID() async {
    final boxname = await Hive.openBox("planogramData");

    boxname.put("retailerid", retailerid.value);
    boxname.put("branchid", branchid.value);
    boxname.put("custmoreid", custmoreid.value);
    boxname.put("categoryid", categoryid.value);
    boxname.put(
      "planogramValue",
      checkController.selectRadioBtnVal.value,
    );
  }

  Future<void> cleaningFtnStoringID() async {
    final boxname = await Hive.openBox("cleaningData");

    boxname.put("retailerid", retailerid.value);
    boxname.put("branchid", branchid.value);
    boxname.put("custmoreid", custmoreid.value);
    boxname.put("categoryid", categoryid.value);
    boxname.put(
      "cleaningValue",
      checkController.selectRadioBtnVal.value,
    );
  }

  Future<void> neighborsFtnStoringID(
      String leftdropValue, String rightDropVlaue) async {
    final boxname = await Hive.openBox("neighborsData");

    boxname.put("retailerid", retailerid.value);
    boxname.put("branchid", branchid.value);
    boxname.put("custmoreid", custmoreid.value);
    boxname.put("categoryid", categoryid.value);
    boxname.put("leftDropValue", leftdropValue);
    boxname.put("rightDropVaalue", rightDropVlaue);
  }

  Future<void> osaFtnStoringID(List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("osaData");

    boxname.put("OsadataList", dataList);
  }
}
