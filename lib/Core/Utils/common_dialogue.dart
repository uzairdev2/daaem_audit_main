// ignore_for_file: unnecessary_null_comparison, avoid_init_to_null, unrelated_type_equality_checks

import 'dart:developer';

import 'package:daaem_reports/Core/Constant/Colors/colors.dart';
import 'package:daaem_reports/Core/Constant/Images/images.dart';
import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../Controller/controller_detail.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class CommonDialog {
  showPopCustom({
    required String title,
    required String btn1Name,
    required String btn2Name,
    Color? color,
    // String? barcode,
    required VoidCallback btn1Ontap,
    required VoidCallback btn2Ontap,
    required VoidCallback submitOntap,
    value1 = null,
    value2 = null,
    Widget customwidget = const SizedBox.shrink(),
    barcodeStatus = 1,
    imageStatus = 1,
    takePictureStatus = 1,
    index = 0,
  }) {
    Get.dialog(AlertDialog(
      backgroundColor: white,
      title: Padding(
        padding: EdgeInsets.only(left: 0.w, top: 20, right: 10.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: CustomText(
                name: title,
                color: black,
                size: 16.sp,
                alignment: TextAlign.center,
                weightFont: FontWeight.w500,
              ),
            ),
            20.h.ph,
            takePictureStatus == 0
                ? Obx(
                    () => imageContoller.imagevalue[index] != false
                        ? Image.file(
                            imageContoller.rowImages[index],
                            fit: BoxFit.fitWidth,
                            width: 50,
                            height: 50.h,
                          )
                        : 0.ph,
                  )
                : 0.ph,
            15.h.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => CustomButtonCheckBox(
                    width: 80.w,
                    height: 40.h,
                    size: 12.sp,
                    color: color ?? aquamarine,
                    checkbox: SizedBox(
                      height: 40.h,
                      width: 80.w,
                      child: Radio(
                        value: value1 ?? "Yes",
                        activeColor: white,
                        groupValue: checkController.selectRadioBtnVal.value,
                        onChanged: (value) {
                          checkController.handleYesButtonClick(value!);
                          log("here is inside common dialog value $value");
                          log("here is inside common dialog value ${checkController.selectRadioBtnVal.value}");
                        },
                      ),
                    ),
                    name: btn1Name,
                    ontap: btn1Ontap,
                  ),
                ),
                5.w.pw,
                Obx(
                  () => CustomButtonCheckBox(
                    width: 80.w,
                    height: 40.h,
                    size: 12.sp,
                    color: color ?? red,
                    checkbox: SizedBox(
                      height: 40.h,
                      width: 80.w,
                      child: Radio(
                        activeColor: white,
                        value: value2 ?? "No",
                        groupValue: checkController.selectRadioBtnVal.value,
                        onChanged: (value) {
                          checkController.handleNoButtonClick(value!);
                          log("here is inside common dialog value $value");
                          log("here is inside common dialog value ${checkController.selectRadioBtnVal.value}");
                        },
                      ),
                    ),

                    // CustomCheckBox(value: checkController.noValue),
                    name: btn2Name,
                    ontap: btn2Ontap,
                  ),
                ),
              ],
            ),
            15.h.ph,
            barcodeStatus == 0
                ? Obx(() => Column(children: [
                      scanController.barValueCheck[index].value == false
                          ? InkWell(
                              onTap: () {
                                scanController.scanBarcode(
                                    "4796007317504", index);
                              },
                              child: CustomText(name: "Try Agian 😔"))
                          : CustomText(name: "Matched ☺ ")
                    ]))
                : const SizedBox.shrink(),
            20.h.ph,
            imageStatus == 0 ? const CameraWIdget() : const SizedBox.shrink(),
            Align(
              alignment: Alignment.bottomRight,
              child: CustomButton(
                width: 87.w,
                height: 40.h,
                color: aquamarine,
                name: "Submit",
                ontap: submitOntap,
              ),
            )
          ],
        ),
      ),
    ));
  }

  showPopwithCustom({
    required String name,
    required Widget colum,
    imagestate = 0,
  }) {
    Get.dialog(SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: AlertDialog(
          backgroundColor: white,
          title: Padding(
            padding: EdgeInsets.only(
              left: 10.w,
              top: 20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CustomText(
                    name: name,
                    color: black,
                    size: 16.sp,
                    alignment: TextAlign.center,
                    weightFont: FontWeight.w500,
                  ),
                ),
                20.h.ph,
                colum
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class CameraWIdget extends StatelessWidget {
  const CameraWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            width: 47.w,
            height: 47.h,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: aquamarine,
              ),
            ),
            child: Obx(() {
              return imageContoller.valueCheck.value != false
                  ? Image.file(
                      imageContoller.cleanimageFile.value!,
                      fit: BoxFit.cover,
                    )
                  : Center(
                      child: Image.asset(
                        camera,
                        width: 22.w,
                        height: 20.h,
                      ),
                    );
            })),
        10.w.pw,
        InkWell(
          onTap: () async {
            await imageContoller.cleanessImage();
          },
          child: CustomText(
            name: "Take a Picture",
            color: black,
            size: 12.sp,
            alignment: TextAlign.center,
            weightFont: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
