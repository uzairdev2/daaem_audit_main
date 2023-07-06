import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hive/hive.dart';

class BackDoorFtnBtn extends GetxController {
  Map<String, dynamic> bakcDoor = {};

  backDoorFtnStoringID(List<Map<String, dynamic>> dataList) async {
    final boxname = await Hive.openBox("backdoorData");

    boxname.addAll(dataList);
    boxname.toMap().forEach((key, value) {
      bakcDoor[key.toString()] = value;
    });
  }

  List convertedListpointOFsales = [];
  getData() async {
    convertedListpointOFsales = bakcDoor.values
        .map((innerMap) => innerMap.cast<String, dynamic>())
        .toList();
    bakcDoor.forEach((key, value) {
      print("$key, $value");
    });
  }

  // List<BackDoorData> get backDoorDataList => _box?.values.toList() ?? [];

  // void deleteBackDoorData(int index) {
  //   _box?.deleteAt(index);
  //   update();
  // }

  // void updateQuantity(int index, int newQuantity) {
  //   final data = _box?.getAt(index);
  //   if (data != null) {
  //     data.quantity = newQuantity as String;
  //     _box?.putAt(index, data);
  //     update();
  //   }
  // }

  // @override
  // void onClose() {
  //   _box?.close();
  //   super.onClose();
  // }
}

class BackDoorData {
  String tableName;
  String retailerId;
  String branchId;
  String customerId;
  String quantity;
  String barcode;

  BackDoorData({
    required this.tableName,
    required this.retailerId,
    required this.branchId,
    required this.customerId,
    required this.quantity,
    required this.barcode,
  });
}
