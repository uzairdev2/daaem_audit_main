import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class DataModel {
  final String retailerId;
  final String branchId;
  final String customerId;
  final String categoryId;
  final String productId;
  final String osaValue;
  final String barcode;
  final String imageData;

  DataModel({
    required this.retailerId,
    required this.branchId,
    required this.customerId,
    required this.categoryId,
    required this.productId,
    required this.osaValue,
    required this.barcode,
    required this.imageData,
  });
}

class DataController extends GetxController {
  final dataList = <DataModel>[].obs;

  Future<void> storeData(int index, DataModel data) async {
    final boxname = await Hive.openBox("osaData");
    boxname.putAt(index, data);
  }

  DataModel getData(int index) {
    final boxname = Hive.box("osaData");
    final data = boxname.getAt(index) as DataModel;
    return data;
  }
}

class MyApp extends StatelessWidget {
  final DataController dataController = Get.put(DataController());

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Data Storage Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('Data Storage Example')),
        body: ListView.builder(
          itemCount: dataController.dataList.length,
          itemBuilder: (context, index) {
            final data = dataController.getData(index);
            return ListTile(
              title: Text('Data $index'),
              subtitle: Text(data.osaValue),
              trailing: ElevatedButton(
                onPressed: () => openAlertDialog(index),
                child: const Text('Select'),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> openAlertDialog(int index) async {
    final data = dataController.getData(index);

    String? selectedValue = "";
    showDialog<String>(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Value'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text('Yes'),
                leading: Radio<String>(
                  value: 'Yes',
                  groupValue: data.osaValue,
                  onChanged: (value) {
                    selectedValue = value;
                  },
                ),
              ),
              ListTile(
                title: const Text('No'),
                leading: Radio<String>(
                  value: 'No',
                  groupValue: data.osaValue,
                  onChanged: (value) {
                    selectedValue = value;
                  },
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                if (selectedValue != null) {
                  final updatedData = data.copyWith(osaValue: selectedValue);
                  dataController.storeData(index, updatedData);
                }
                Navigator.of(context).pop(selectedValue);
              },
              child: const Text('Submit'),
            ),
          ],
        );
      },
    );

    if (selectedValue != null) {
      dataController.dataList[index] = data.copyWith(osaValue: selectedValue);
    }
  }
}

extension DataModelExtension on DataModel {
  DataModel copyWith({
    String? retailerId,
    String? branchId,
    String? customerId,
    String? categoryId,
    String? productId,
    String? osaValue,
    String? barcode,
    String? imageData,
  }) {
    return DataModel(
      retailerId: retailerId ?? this.retailerId,
      branchId: branchId ?? this.branchId,
      customerId: customerId ?? this.customerId,
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      osaValue: osaValue ?? this.osaValue,
      barcode: barcode ?? this.barcode,
      imageData: imageData ?? this.imageData,
    );
  }
}
