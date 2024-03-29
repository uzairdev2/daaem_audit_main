// ignore_for_file: avoid_print, unrelated_type_equality_checks

import 'package:daaem_reports/Core/Controller/controller_detail.dart';
import 'package:daaem_reports/Core/Utils/common_dialogue.dart';
import 'package:daaem_reports/Core/Utils/custom_button.dart';
import 'package:daaem_reports/Core/Utils/custom_text.dart';
import 'package:daaem_reports/Core/Utils/custom_textfield.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Constant/Colors/colors.dart';
import '../Local DB/model.dart';
import '../Local DB/openBox.dart';
import 'btn_controller.dart/backdoor_hive.dart';

class ScanController extends GetxController {
  final commonDialog = CommonDialog().obs;
  RxString barcode = ''.obs;
  RxString listCode = ''.obs;
  List<RxBool> barValueCheck = [];
  RxBool valueCheck = false.obs;
  String quantity = "";

  Future<void> scanBarcode(String apiBarcode, int index) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000', // Custom color for the scanner overlay
      'Cancel', // Text for the cancel button
      true, // Enable flash option
      ScanMode
          .DEFAULT, // Scan mode (barcode, QR code, or all supported formats)
    );

    if (barcodeScanRes != '-1') {
      barcode.value = barcodeScanRes;
      if (barcode == apiBarcode) {
        barValueCheck[index].value = true;
      } else {
        barValueCheck[index].value = false;
      }

      update();
    } else {
      // No barcode scanned
      barcode.value = 'Barcode cannot be scanned';
    }
  }

  Future<void> checkingList(List<dynamic> logo) async {
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
      '#FF0000', // Custom color for the scanner overlay
      'Cancel', // Text for the cancel button
      true, // Enable flash option
      ScanMode
          .DEFAULT, // Scan mode (barcode, QR code, or all supported formats)
    );

    if (barcodeScanRes != '-1') {
      listCode.value = barcodeScanRes;
      List<dynamic> matchingValues =
          logo.where((item) => item.code.toString() == listCode.value).toList();
      if (matchingValues.isNotEmpty) {
        dynamic matchedProduct = matchingValues[0];
        String productId = matchedProduct.productId.toString();
        commonDialog.value.showPopwithCustom(
            name: "Product ID$productId",
            colum: Column(
              children: [
                CustomText(
                  name: "Barcode:${listCode.value}",
                ),
                15.h.ph,
                CustomTextfield(
                  hintext: "Enter Quantity",
                  height: 50.h,
                  width: 200.w,
                  onchanged: (value) {
                    quantity = value;
                  },
                  textType: TextInputType.number,
                ),
                15.h.ph,
                Align(
                  alignment: Alignment.centerRight,
                  child: CustomButton(
                    width: 87.w,
                    height: 40.h,
                    name: "submit",
                    ontap: () {
                      print("on tap");

                      backDoorFtnBtn.backDoorFtnStoringID([
                        {
                          "table_name": 'backDoor',
                          "retailerid": storingIDController.retailerid.value,
                          "branchid": storingIDController.branchid.value,
                          "customerid": storingIDController.custmoreid.value,
                          "quantity": quantity,
                          "barcode": listCode.value,
                        }
                      ]);
                      Get.back();
                    },
                  ),
                )
              ],
            ));

        valueCheck.value = true;
      } else {
        valueCheck.value = false;
        Get.snackbar("Faild", "Scan is Field Product didnt Matched",
            backgroundColor: red, snackPosition: SnackPosition.BOTTOM);
      }

      update();
    } else {
      // No barcode scanned
      barcode.value = 'Barcode cannot be scanned';
    }
  }
}
