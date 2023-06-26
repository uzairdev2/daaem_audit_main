// ignore_for_file: unnecessary_null_comparison, avoid_print, unnecessary_brace_in_string_interps, file_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class ProductDetailController extends GetxController {
  RxBool osaRadioValue = false.obs;
  RxBool priceRadioValue = false.obs;
  RxBool stockRadioValue = false.obs;
  RxBool accessRadioValue = false.obs;
  RxString name = "".obs;
  List osaList = [];
  List<dynamic> osaVAlueYesorNO = [];
  List<dynamic> priceVAlueYesorNO = [];
  List<dynamic> stockVAlueYesorNO = [];
  List<dynamic> accessVAlueYesorNO = [];
  void handlePriceButtonClick(String gernder, int index) {
    priceRadioValue.value = !priceRadioValue.value;
    priceVAlueYesorNO[index].value = gernder;
  }

  void handleStockButtonClick(String gernder, int index) {
    stockRadioValue.value = !stockRadioValue.value;
    stockVAlueYesorNO[index].value = gernder;
  }

  void handleAccessButtonClick(String gernder, int index) {
    accessRadioValue.value = !accessRadioValue.value;
    accessVAlueYesorNO[index].value = gernder;
  }

  void handleYesButtonClick(String gernder, int index) {
    osaRadioValue.value = !osaRadioValue.value;
    osaVAlueYesorNO[index].value = gernder;
  }

  handleNoButtonClick(String gernder, int index) {
    osaRadioValue.value = !osaRadioValue.value;
    osaVAlueYesorNO[index].value = gernder;
  }

  Future<void> osaFtnStoringID(
      int index, List<Map<String, dynamic>> dataList) async {
    try {
      final boxname = await Hive.openBox("osa");
      boxname.put("Tablename", 'osa table');
      boxname.clear();
      if (index >= 0) {
        boxname.putAt(0, dataList);
        print('Data stored successfully at index $index');
        print('Box length: ${boxname.length}');
      } else {
        print('Invalid index: $index');
      }
    } catch (e) {
      print('Error storing data: $e');
    }
  }

  Future<void> getOsaValue(int index) async {
    final boxname = await Hive.openBox("osaData");

    if (index >= 0 && index < boxname.length) {
      final dataList = boxname.getAt(index) as List<Map<String, dynamic>>;

      if (dataList.isNotEmpty) {
        final data = dataList.first;
        print("this is the list of index  ${index} :${dataList}");
        final osaValue = data['osaValue'];
        if (osaValue != null) {
          print('osaValue: $osaValue');
          // osaVAlueYesorNO[index] = osaValue;
          // osaVAlueYesorNO.addIf(index, osaValue);
          print("thet get from hive :${osaVAlueYesorNO[index]}");
        } else {
          print('Data not found for index $index');
        }
      } else {
        print('Data list is empty for index $index');
      }
    } else {
      print('Invalid index: $index');
    }
  }

  Future<dynamic> getSpecificValueFromBox(int index, String key) async {
    final box = await Hive.openBox<Map<String, dynamic>>('osaData');
    Map<String, dynamic>? data = box.getAt(index);

    if (data != null && data.containsKey(key)) {
      dynamic specificValue = data[key];

      return specificValue;
    }

    return null; // Handle the case when the data or key is not found
  }

  Future<void> updateValueAtIndex(int index, dynamic newValue) async {
    final box = await Hive.openBox<List<dynamic>>('osaData');
    List<dynamic>? dataList = box.getAt(index);

    if (dataList != null) {
      if (index < dataList.length) {
        // Update the value at the desired index
        dataList[index] = newValue;

        // Save the updated data back to the box
        box.putAt(index, dataList);
        print('Value updated successfully at index $index');
      } else {
        print('Invalid index: $index');
      }
    } else {
      print('Data list is null for index $index');
    }

    await box.close();
  }
}







//  final box = Hive.box('myBox');
//   List<String> myList = box.get('myList', defaultValue: []);

//   // Update data at index 2
//   if (myList.length > 2) {
//     myList[2] = 'Updated Value';
//   }

//   // Save the updated list back to the box
//   box.put('myList', myList);