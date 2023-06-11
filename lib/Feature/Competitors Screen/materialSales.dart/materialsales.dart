// ignore_for_file: avoid_print

import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../Core/Constant/Colors/colors.dart';
import '../../../Core/Controller/controller_detail.dart';
import '../../../Core/Utils/Camera Widget/camera_widget.dart';
import '../../../Core/Utils/checkbox.dart';
import '../../../Core/Utils/customButton.dart';
import '../../../Core/Utils/customText.dart';
import '../../../Core/Utils/custom_textfield.dart';

class MaterialSalesScreen extends StatelessWidget {
  const MaterialSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(
          name: "Sales Material",
          size: 18.sp,
          weightFont: FontWeight.w700,
        ),
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w, top: 24.h),
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                  color: aquamarine, borderRadius: BorderRadius.circular(5.r)),
              child: Icon(
                Icons.arrow_back,
                color: white,
                weight: 18.w,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, top: 15.h, right: 16.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: red,
                      checkbox: CustomCheckBox(
                          onChanged: (value) {
                            checkController.checkValue2.value = value;
                          },
                          value: checkController.checkValue2),
                      name: "Gandula",
                      ontap: () {
                        checkController.checkValue2.value =
                            !checkController.checkValue2.value;
                      },
                    ),
                    10.h.ph,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(() {
                        return Visibility(
                            visible: checkController.checkValue2.value,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CameraWidget(
                                buttonText: "Take a Picture for\n Gandula",
                                imagePath: imageContoller.materialimageFile,
                                showImage: imageContoller.materialgandulaValue,
                                onTap: () {
                                  imageContoller.materialGandulaImage();
                                },
                              ),
                            ));
                      }),
                    ),
                  ],
                ),
                5.w.pw,
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: red,
                      checkbox: CustomCheckBox(
                        value: checkController.checkValue1,
                        onChanged: (value) {
                          checkController.checkValue1.value = value;
                        },
                      ),
                      name: "Floor Display",
                      ontap: () {
                        checkController.checkValue1.value =
                            !checkController.checkValue1.value;
                      },
                    ),
                    10.h.ph,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(() {
                        return Visibility(
                            visible: checkController.checkValue1.value,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: CameraWidget(
                                buttonText: "Take a Picture for\n Floor",
                                imagePath:
                                    imageContoller.materialfloorimageFile,
                                showImage: imageContoller.materialfloorValue,
                                onTap: () {
                                  imageContoller.materiaFloorImage();
                                },
                              ),
                            ));
                      }),
                    ),
                  ],
                ),
              ],
            ),
            20.h.ph,
            Row(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomButtonCheckBox(
                        width: 160.w,
                        height: 46.h,
                        size: 12.sp,
                        color: aquamarine,
                        checkbox: CustomCheckBox(
                          value: checkController.otherValue2,
                          onChanged: (value) {
                            checkController.otherValue2.value = value;
                          },
                        ),
                        name: "Other",
                        ontap: () {
                          checkController.otherValue2.value =
                              !checkController.otherValue2.value;
                        },
                      ),
                    ),
                    15.h.ph,
                    Obx(
                      () => Visibility(
                        visible: checkController.otherValue2.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CustomText(
                                name: "Point Of Sales Material",
                                size: 12.sp,
                                weightFont: FontWeight.w600,
                              ),
                            ),
                            10.h.ph,
                            CustomTextfield(
                              hintext: "Enter the name of Material",
                              bgcolor: lightgrey,
                              width: 160.w,
                              height: 46.h,
                              onchanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                5.w.pw,
                Column(
                  children: [
                    CustomButtonCheckBox(
                      width: 160.w,
                      height: 46.h,
                      size: 12.sp,
                      color: aquamarine,
                      checkbox: CustomCheckBox(
                        value: checkController.promositeValue2,
                        onChanged: (value) {
                          checkController.promositeValue2.value = value;
                        },
                      ),
                      name: "Promo Site",
                      ontap: () {
                        checkController.promositeValue2.value =
                            !checkController.promositeValue2.value;
                      },
                    ),
                    15.h.ph,
                    Obx(() {
                      return Visibility(
                          visible: checkController.promositeValue2.value,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: CameraWidget(
                              buttonText: "Take a Picture for\n Promo Site",
                              imagePath:
                                  imageContoller.materialPromositeimageFile,
                              showImage: imageContoller.materialPromositeValue,
                              onTap: () {
                                imageContoller.materialPromositeImage();
                              },
                            ),
                          ));
                    }),
                  ],
                )
              ],
            ),
            10.h.ph,
            Align(
              alignment: Alignment.bottomLeft,
              child: CustomText(
                name: "Add a note",
                size: 12.sp,
                weightFont: FontWeight.w600,
              ),
            ),
            10.h.ph,
            CustomTextfield(
              hintext: "Enter Text",
              bgcolor: lightgrey,
              width: 303.w,
              height: 55.h,
              onchanged: (value) {},
            ),
            10.h.ph,
            10.h.ph,
            Align(
                alignment: Alignment.bottomLeft,
                child: CameraWidget(
                  containerHeight: 80.h,
                  containerWidth: 100.w,
                  imagePath: imageContoller.materialimageFile,
                  showImage: imageContoller.materialValue,
                  onTap: () {
                    imageContoller.materialImage();
                    print(imageContoller.materialValue.value);
                  },
                )),
            20.h.ph,
            CustomButton(
              width: 320.w,
              height: 46.h,
              color: aquamarine,
              name: "Submit",
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
