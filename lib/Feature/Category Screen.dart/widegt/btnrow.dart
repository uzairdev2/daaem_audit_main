// ignore_for_file: unnecessary_null_comparison, must_be_immutable, unrelated_type_equality_checks, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../Core/API,s Intergartion/API,s.dart';
import '../../../Core/Constant/Colors/colors.dart';
import '../../../Core/Constant/Text/text.dart';
import '../../../Core/Controller/controller_detail.dart';
import '../../../Core/Utils/customButton.dart';
import '../../../Core/Utils/customText.dart';
import '../category_screen.dart';

class BtnRow extends StatelessWidget {
  BtnRow({required this.index, super.key});
  int index;
  void printAllData() async {
    final boxname = await Hive.openBox("osaData");
    final dataList = boxname.values.toList();

    for (var data in dataList) {
      print(data.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final logPro = Provider.of<ApiClass>(context);

    return Row(
      children: [
        CustomButton(
            width: 108.w,
            height: 46.h,
            name: "Product Details",
            size: 12.sp,
            ontap: () async {
              controller.commonDialog.value.showPopwithCustom(
                  name: productDetailText,
                  colum: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        name: sOSPopText,
                        size: 12.sp,
                      ),
                      10.h.ph,
                      Row(
                        children: [
                          Obx(
                            () => CustomRadioWidget(
                              onTap: () {
                                productDetailController.handleYesButtonClick(
                                    "yes", index);
                                scanController.scanBarcode(
                                    logPro.productList[index].barcode
                                        .toString(),
                                    index);
                              },
                              name: "Yes",
                              value: "yes",
                              width: 70.w,
                              height: 40.h,
                              groupValue: productDetailController
                                  .osaVAlueYesorNO[index].value,
                              color: aquamarine,
                              onChanged: (value) {
                                productDetailController.handleYesButtonClick(
                                    value!, index);
                                scanController.scanBarcode(
                                    logPro.productList[index].barcode
                                        .toString(),
                                    index);
                              },
                            ),
                          ),
                          10.w.pw,
                          Obx(
                            () => CustomRadioWidget(
                              color: red,
                              onTap: () {
                                productDetailController.handleNoButtonClick(
                                    "no", index);
                              },
                              name: "No",
                              value: "no",
                              width: 67.w,
                              height: 40.h,
                              groupValue: productDetailController
                                  .osaVAlueYesorNO[index].value,
                              onChanged: (value) {
                                productDetailController.handleYesButtonClick(
                                    value!, index);
                              },
                            ),
                          ),
                        ],
                      ),
                      5.h.ph,
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Obx(() {
                          return scanController.barValueCheck[index].value ==
                                  false
                              ? InkWell(
                                  onTap: () {
                                    scanController.scanBarcode(
                                        logPro.productList[index].barcode
                                            .toString(),
                                        index);
                                  },
                                  child: CustomText(
                                    name: "Try Again",
                                    size: 12.sp,
                                    weightFont: FontWeight.bold,
                                  ))
                              : CustomText(name: "Matched ☺ ");
                        }),
                      ),
                      10.h.ph,
                      Center(
                        child: Obx(
                          () => Visibility(
                            visible: productDetailController
                                    .osaVAlueYesorNO[index].value ==
                                "yes",
                            child: Column(
                              children: [
                                CustomText(
                                  name: pricePopText,
                                  size: 12.sp,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Obx(
                                        () => CustomRadioWidget(
                                          color: aquamarine,
                                          onTap: () {
                                            productDetailController
                                                .handlePriceButtonClick(
                                                    "yes", index);
                                          },
                                          name: "Yes",
                                          value: "yes",
                                          width: 70.w,
                                          height: 40.h,
                                          groupValue: productDetailController
                                              .priceVAlueYesorNO[index].value,
                                          onChanged: (value) {
                                            productDetailController
                                                .handlePriceButtonClick(
                                                    value!, index);
                                          },
                                        ),
                                      ),
                                      10.w.pw,
                                      Obx(
                                        () => CustomRadioWidget(
                                          color: red,
                                          onTap: () {
                                            productDetailController
                                                .handlePriceButtonClick(
                                                    "no", index);
                                          },
                                          name: "No",
                                          value: "no",
                                          width: 67.w,
                                          height: 40.h,
                                          groupValue: productDetailController
                                              .priceVAlueYesorNO[index].value,
                                          onChanged: (value) {
                                            productDetailController
                                                .handlePriceButtonClick(
                                                    value!, index);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                10.h.ph,
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: CustomText(
                                    name: stockLevelPopText,
                                    size: 12.sp,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Obx(
                                      () => CustomRadioWidget(
                                        color: aquamarine,
                                        onTap: () {
                                          productDetailController
                                              .handleStockButtonClick(
                                                  "Normal", index);
                                        },
                                        name: "Normal",
                                        value: "Normal",
                                        width: 90.w,
                                        height: 40.h,
                                        groupValue: productDetailController
                                            .stockVAlueYesorNO[index].value,
                                        onChanged: (value) {
                                          productDetailController
                                              .handleStockButtonClick(
                                                  value!, index);
                                        },
                                      ),
                                    ),
                                    10.w.pw,
                                    Obx(
                                      () => CustomRadioWidget(
                                        color: red,
                                        onTap: () {
                                          productDetailController
                                              .handleStockButtonClick(
                                                  "Low", index);
                                        },
                                        name: "Low",
                                        value: "Low",
                                        width: 75.w,
                                        height: 40.h,
                                        groupValue: productDetailController
                                            .stockVAlueYesorNO[index].value,
                                        onChanged: (value) {
                                          productDetailController
                                              .handleStockButtonClick(
                                                  value!, index);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                10.h.ph,
                                CustomText(
                                  name: accessPopText,
                                  size: 12.sp,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Obx(
                                        () => CustomRadioWidget(
                                          color: aquamarine,
                                          onTap: () {
                                            productDetailController
                                                .handleAccessButtonClick(
                                                    "yes", index);
                                          },
                                          name: "Yes",
                                          value: "yes",
                                          width: 70.w,
                                          height: 40.h,
                                          groupValue: productDetailController
                                              .accessVAlueYesorNO[index].value,
                                          onChanged: (value) {
                                            productDetailController
                                                .handleAccessButtonClick(
                                                    value!, index);
                                          },
                                        ),
                                      ),
                                      10.w.pw,
                                      Obx(
                                        () => CustomRadioWidget(
                                          color: red,
                                          onTap: () {
                                            productDetailController
                                                .handleAccessButtonClick(
                                                    "no", index);
                                          },
                                          name: "No",
                                          value: "no",
                                          width: 67.w,
                                          height: 40.h,
                                          groupValue: productDetailController
                                              .accessVAlueYesorNO[index].value,
                                          onChanged: (value) {
                                            productDetailController
                                                .handleAccessButtonClick(
                                                    value!, index);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: CustomButton(
                          width: 87.w,
                          height: 40.h,
                          color: red,
                          name: "Submit",
                          ontap: () async {
                            if (productDetailController
                                        .osaVAlueYesorNO[index] !=
                                    null &&
                                productDetailController
                                        .stockVAlueYesorNO[index] !=
                                    null) {
                              String cleanBase64Image = "";
                              if (logPro.productList[index].imagePath != null &&
                                  logPro.productList[index].imagePath
                                      .isNotEmpty) {
                                print(
                                    "this work ${logPro.productList[index].imagePath.toString()}");
                                List<int> imageBytes = await File(
                                        logPro.productList[index].imagePath)
                                    .readAsBytes();
                                cleanBase64Image =
                                    logPro.productList[index].imagePath != null
                                        ? base64Encode(imageBytes)
                                        : "no images";
                              }
                              storingIDController.osaFtnStoringID([
                                {
                                  "table_name": "product_detail",
                                  "retailerid":
                                      storingIDController.retailerid.value,
                                  "branchid":
                                      storingIDController.branchid.value,
                                  "custmoreid":
                                      storingIDController.custmoreid.value,
                                  "categoryid":
                                      storingIDController.categoryid.value,
                                  "productId": logPro
                                      .productList[index].productId
                                      .toString(),
                                  "osa": productDetailController
                                      .osaVAlueYesorNO[index].value,
                                  "pricevalue": productDetailController
                                      .priceVAlueYesorNO[index].value,
                                  "stockvalue": productDetailController
                                      .stockVAlueYesorNO[index].value,
                                  "accessible": productDetailController
                                      .accessVAlueYesorNO[index].value,
                                  "imagedata": cleanBase64Image,
                                }
                              ]);
                              Get.back();
                              Get.snackbar("Saved", "SuccessFully",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.white);
                            } else {
                              Get.back();
                              Get.snackbar("Failed", "To save data",
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: Colors.white);
                            }
                          },
                        ),
                      )
                    ],
                  ));
            }),
        12.w.pw,
      ],
    );
  }
}
