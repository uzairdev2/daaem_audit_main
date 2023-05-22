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
  showPopCustom(
      {required String title,
      required String btn1Name,
      required String btn2Name,
      Color? color,
      required VoidCallback btn1Ontap,
      required VoidCallback btn2Ontap,
      required VoidCallback submitOntap,
      Widget customwidget = const SizedBox.shrink(),
      imageStatus = 0}) {
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
            customwidget == const SizedBox()
                ? const SizedBox.shrink()
                : customwidget,
            20.h.ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonCheckBox(
                  width: 80.w,
                  height: 40.h,
                  size: 12.sp,
                  color: color ?? aquamarine,
                  checkbox: Obx(
                    () => SizedBox(
                      height: 40.h,
                      width: 80.w,
                      child: Radio<String>(
                        value: "Yes",
                        activeColor: white,
                        groupValue: checkController.selectRadioBtnVal.value,
                        onChanged: (value) {
                          checkController.handleYesorNoChange(value!);
                        },
                      ),
                    ),
                  ),
                  name: btn1Name,
                  ontap: btn1Ontap,
                ),
                5.w.pw,
                CustomButtonCheckBox(
                  width: 80.w,
                  height: 40.h,
                  size: 12.sp,
                  color: color ?? red,
                  checkbox: Obx(
                    () => SizedBox(
                      height: 40.h,
                      width: 80.w,
                      child: Radio(
                        activeColor: white,
                        value: "No",
                        groupValue: checkController.selectRadioBtnVal.value,
                        onChanged: (value) {
                          checkController.handleYesorNoChange(value!);
                        },
                      ),
                    ),
                  ),
                  // CustomCheckBox(value: checkController.noValue),
                  name: "No",
                  ontap: btn1Ontap,
                ),
              ],
            ),
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
  }) {
    Get.dialog(AlertDialog(
      backgroundColor: white,
      title: Padding(
        padding: EdgeInsets.only(left: 10.w, top: 20, right: 10.w),
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
              borderRadius: BorderRadius.circular(10.r)),
          child: Center(
            child: imageContoller.imageFile != null
                ? Obx(() {
                    log("${imageContoller.imageFile.value}");

                    return Image.file(
                      imageContoller.imageFile.value!,
                      width: 30.w,
                      height: 30.h,
                    );
                  })
                : Image.asset(
                    camera,
                    width: 22.w,
                    height: 20.h,
                  ),
          ),
        ),
        10.w.pw,
        InkWell(
          onTap: () async {
            await imageContoller.proFile();
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
