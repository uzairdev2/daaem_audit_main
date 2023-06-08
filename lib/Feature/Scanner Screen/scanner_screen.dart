// ignore_for_file: unnecessary_null_comparison

import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/custom_text.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../Core/API,s Intergartion/API,s.dart';
import '../../Core/Local DB/model.dart';
import '../../Core/Local DB/openBox.dart';
import '../../Core/Utils/custom_textfield.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  void _deleteItem(int index) {
    final box = Boxes.getData();
    box.deleteAt(index);
  }

  void _editItem(int index, String barcode, String quantity) async {
    final box = Hive.box<ModelHive>('scanData');
    final newData = ModelHive(barcode: barcode, quamtitiy: quantity);
    box.putAt(index, newData);
  }

  var quantity = "";
  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: CustomText(
            name: 'QR Scanner',
            weightFont: FontWeight.w700,
          ),
        ),
        body: Padding(
            padding: EdgeInsets.all(15.sp),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  CustomText(
                    name: 'Place the QR code in the area',
                    weightFont: FontWeight.w800,
                    size: 18.sp,
                    color: black,
                  ),
                  10.h.ph,
                  CustomText(
                    name: 'Scanning will be start automatically',
                    size: 14.sp,
                    color: grey,
                  ),
                  50.h.ph,
                  CustomButton(
                    ontap: () {
                      scanController.checkingList(logPro.scanProduct);
                    },
                    name: 'Start Scanning',
                    color: red,
                    height: 45.h,
                    width: 250.w,
                  ),
                  15.h.ph,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          10.w.pw,
                          CustomText(
                            name: "List Of Quantity",
                            size: 16.sp,
                            weightFont: FontWeight.w600,
                            color: black,
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          categoryController.visibilityTrue2();
                        },
                        child: Container(
                          width: 24.w,
                          height: 24.h,
                          decoration: BoxDecoration(
                              color: white,
                              borderRadius: BorderRadius.circular(5.r)),
                          child: const Center(
                              child: Icon(
                            Icons.arrow_drop_down,
                            color: grey,
                          )),
                        ),
                      )
                    ],
                  ),
                  Obx(() => Visibility(
                      visible: categoryController.visibilityValue2.value,
                      child: ValueListenableBuilder<Box<ModelHive>>(
                          valueListenable: Boxes.getData().listenable(),
                          builder: (context, boxes, _) {
                            var data = boxes.values.toList().cast<ModelHive>();

                            return Card(
                              child: ListView.builder(
                                  itemCount: boxes.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        ListTile(
                                          title: CustomText(
                                              name:
                                                  "Barcode :${data[index].barcode}"),
                                          subtitle: CustomText(
                                              name:
                                                  "Quantity :${data[index].quamtitiy}"),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.edit),
                                                onPressed: () {
                                                  // Perform edit operation for the item at this index
                                                  scanController
                                                      .commonDialog.value
                                                      .showPopwithCustom(
                                                          name: data[index]
                                                              .barcode,
                                                          colum: Column(
                                                            children: [
                                                              10.h.ph,
                                                              CustomTextfield(
                                                                hintext:
                                                                    "Enter Quantity",
                                                                height: 50.h,
                                                                width: 200.w,
                                                                onchanged:
                                                                    (value) {
                                                                  quantity =
                                                                      value;
                                                                },
                                                                textType:
                                                                    TextInputType
                                                                        .number,
                                                              ),
                                                              10.h.ph,
                                                              CustomButton(
                                                                name: "Save",
                                                                ontap: () {
                                                                  _editItem(
                                                                      index,
                                                                      data[index]
                                                                          .barcode,
                                                                      quantity);
                                                                  Get.back();
                                                                },
                                                              )
                                                            ],
                                                          ));
                                                },
                                              ),
                                              IconButton(
                                                icon: Icon(Icons.delete),
                                                onPressed: () {
                                                  // Perform delete operation for the item at this index
                                                  _deleteItem(index);
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  }),
                            );
                          })))
                ]))));
  }
}
