import 'package:daaem_reports/Core/Utils/sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Core/Constant/Colors/colors.dart';
import '../../Core/Controller/controller_detail.dart';
import '../../Core/Utils/Camera Widget/camera_widget.dart';
import '../../Core/Utils/checkbox.dart';
import '../../Core/Utils/commonAppbar.dart';
import '../../Core/Utils/common_dialogue.dart';
import '../../Core/Utils/customButton.dart';

class Secondaryplace extends StatelessWidget {
  const Secondaryplace({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Secondary place",
        onBackTap: () {
          Get.back();
        },
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
                        value: checkController.yesValue,
                        onChanged: (value) {
                          checkController.yesValue.value = value;
                        },
                      ),
                      name: "Gandula",
                      ontap: () {
                        checkController.yesValue.value =
                            !checkController.yesValue.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.yesValue.value,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CameraWidget(
                            imagePath: imageContoller.gandulaimageFile,
                            showImage: imageContoller.gandulaValue,
                            onTap: () {
                              imageContoller.gandulaImage();
                            },
                          ),
                        ),
                      );
                    }),
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
                        value: checkController.noValue,
                        onChanged: (value) {
                          checkController.noValue.value = value;
                        },
                      ),
                      name: "Floor Display",
                      ontap: () {
                        checkController.noValue.value =
                            !checkController.noValue.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.noValue.value,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CameraWidget(
                            imagePath: imageContoller.floorimageFile,
                            showImage: imageContoller.floorValue,
                            onTap: () {
                              imageContoller.floorImage();
                            },
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            20.h.ph,
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
                        value: checkController.noVal,
                        onChanged: (value) {
                          checkController.noVal.value = value;
                        },
                      ),
                      name: "Stand",
                      ontap: () {
                        checkController.noVal.value =
                            !checkController.noVal.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.noVal.value,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CameraWidget(
                            imagePath: imageContoller.standimageFile,
                            showImage: imageContoller.standValue,
                            onTap: () {
                              imageContoller.standImage();
                            },
                          ),
                        ),
                      );
                    }),
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
                        value: checkController.yesVal,
                        onChanged: (value) {
                          checkController.yesVal.value = value;
                        },
                      ),
                      name: "Promotion Area",
                      ontap: () {
                        checkController.yesVal.value =
                            !checkController.yesVal.value;
                      },
                    ),
                    10.h.ph,
                    Obx(() {
                      return Visibility(
                        visible: checkController.yesVal.value,
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: CameraWidget(
                            imagePath: imageContoller.promotionimageFile,
                            showImage: imageContoller.promoValue,
                            onTap: () {
                              imageContoller.promoImage();
                            },
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ],
            ),
            20.h.ph,
            CustomButton(
              width: 320.w,
              height: 46.h,
              color: aquamarine,
              name: "Submit",
              ontap: () {
                Get.back();
              },
            )
          ],
        ),
      ),
    );
  }
}
