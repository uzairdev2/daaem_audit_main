// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart';
import 'package:hive/hive.dart';

class OsaFtnBTn extends GetxController {
  RxBool radioValue = false.obs;
  List<RxBool> osaBtnvalue = [];
  RxString name = "".obs;
  List osaList = [];
  List<dynamic> osaVAlueYesorNO = [];

  void handleYesButtonClick(String gernder, int index) {
    radioValue.value = !radioValue.value;
    osaVAlueYesorNO[index].value = gernder;
    osaBtnvalue[index].value = true;
  }

  handleNoButtonClick(String gernder, int index) {
    radioValue.value = !radioValue.value;
    osaBtnvalue[index].value = false;
    osaVAlueYesorNO[index].value = gernder;
  }

  Future<void> osaFtnStoringID(
      int index, List<Map<String, dynamic>> dataList) async {
    try {
      final boxname = await Hive.openBox("osaData");
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

    Future<dynamic> getSpecificValueFromBox(int index, String key) async {
      final box = await Hive.openBox<Map<String, dynamic>>('my_box');
      Map<String, dynamic>? data = box.getAt(index);

      if (data != null && data.containsKey(key)) {
        dynamic specificValue = data[key];

        return specificValue;
      }

      return null; // Handle the case when the data or key is not found
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